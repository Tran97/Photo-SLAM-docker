#include <cuda_runtime.h>
#include <iostream>
#include <thread>
#include <chrono>

void monitorCudaMemory(int interval_ms) {
    size_t free_mem, total_mem;

    while (true) {
        // Query GPU memory usage
        cudaError_t err = cudaMemGetInfo(&free_mem, &total_mem);
        if (err != cudaSuccess) {
            std::cerr << "CUDA error: " << cudaGetErrorString(err) << std::endl;
            return;
        }

        size_t used_mem = total_mem - free_mem;

        // Display memory usage
        std::cout << "Used Memory: " << used_mem / (1024.0 * 1024.0) << " MB"
                  << " / Total Memory: " << total_mem / (1024.0 * 1024.0) << " MB" << std::endl;

        // Wait for the specified interval
        std::this_thread::sleep_for(std::chrono::milliseconds(interval_ms));
    }
}

int main() {
    int interval_ms = 1000; // Update interval in milliseconds

    std::cout << "Monitoring GPU memory usage. Press Ctrl+C to stop." << std::endl;
    monitorCudaMemory(interval_ms);

    return 0;
}
