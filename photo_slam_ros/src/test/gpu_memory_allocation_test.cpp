#include <torch/torch.h>
#include <iostream>
#include <thread>
#include <vector>

int main() {
    try {
        // Check if CUDA is available
        if (!torch::cuda::is_available()) {
            std::cerr << "CUDA is not available on this system." << std::endl;
            return -1;
        }

        std::cout << "Starting GPU memory allocation test..." << std::endl;

        size_t gb_limit = 10; // Set the limit of GB memory to test
        size_t elements_per_gb = 1024 * 1024 * 1024 / sizeof(float); // Number of floats in 1GB
        auto options = torch::TensorOptions().dtype(torch::kFloat32).device(torch::kCUDA);

        std::vector<torch::Tensor> allocated_tensors;
        for (size_t i = 1; i <= gb_limit; ++i) {
            try {
                std::cout << "Attempting to allocate " << i << " GB of GPU memory..." << std::endl;

                // Allocate 1GB tensor
                auto tensor = torch::empty({static_cast<long>(elements_per_gb)}, options);
                tensor.fill_(1.0f); // Fill it with data to ensure the allocation is valid
                allocated_tensors.push_back(tensor); // Store the tensor to keep the memory allocated

                // Synchronize CUDA and print success
                torch::cuda::synchronize();
                std::cout << "Success" << std::endl;

                // Sleep for a moment to simulate use
                std::this_thread::sleep_for(std::chrono::seconds(2));
            } catch (const std::exception& e) {
                std::cerr << "Failed" << e.what() << std::endl;
                break;
            }
        }

        std::cout << "Finished GPU memory allocation test." << std::endl;

    } catch (const std::exception& e) {
        std::cerr << "An error occurred: " << e.what() << std::endl;
        return -1;
    }

    return 0;
}
