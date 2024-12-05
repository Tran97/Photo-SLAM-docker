#include "gaussian_mapper.h"


void GaussianMapper::renderAndRecordFrame(
    std::shared_ptr<GaussianKeyframe> pkf,
    float &dssim,
    float &psnr,
    float &psnr_gs,
    double &render_time,
    std::filesystem::path result_img_dir,
    std::filesystem::path result_gt_dir,
    std::filesystem::path result_loss_dir,
    std::string name_suffix)
{
    auto start_timing = std::chrono::steady_clock::now();


    //auto render_pkg = GaussianRenderer::render(
        //pkf,
        //pkf->image_height_,
        //pkf->image_width_,
        //gaussians_,
        //pipe_params_,
        //background_,
        //override_color_
    //);
    //auto rendered_image = std::get<0>(render_pkg);
    //torch::Tensor masked_image = rendered_image * undistort_mask_[pkf->camera_id_];
    //torch::cuda::synchronize();

    // Render from a GT image pose
    cv::Mat renderFromPose()

    auto end_timing = std::chrono::steady_clock::now();
    auto render_time_ns = std::chrono::duration_cast<std::chrono::nanoseconds>(end_timing - start_timing).count();
    render_time = 1e-6 * render_time_ns;
    auto gt_image = pkf->original_image_;

    dssim = loss_utils::ssim(masked_image, gt_image, device_type_).item().toFloat();
    psnr = loss_utils::psnr(masked_image, gt_image).item().toFloat();
    psnr_gs = loss_utils::psnr_gaussian_splatting(masked_image, gt_image).item().toFloat();

    recordKeyframeRendered(masked_image, gt_image, pkf->fid_, result_img_dir, result_gt_dir, result_loss_dir, name_suffix);    
}

void GaussianMapper::renderAndRecordAllFrames(
    std::string name_suffix)
{
    std::filesystem::path result_dir = result_dir_ / (std::to_string(getIteration()) + name_suffix);
    CHECK_DIRECTORY_AND_CREATE_IF_NOT_EXISTS(result_dir)

    std::filesystem::path image_dir = result_dir / "image";
    if (record_rendered_image_)
        CHECK_DIRECTORY_AND_CREATE_IF_NOT_EXISTS(image_dir);

    std::filesystem::path image_gt_dir = result_dir / "image_gt";
    if (record_ground_truth_image_)
        CHECK_DIRECTORY_AND_CREATE_IF_NOT_EXISTS(image_gt_dir);

    std::filesystem::path image_loss_dir = result_dir / "image_loss";
    if (record_loss_image_) {
        CHECK_DIRECTORY_AND_CREATE_IF_NOT_EXISTS(image_loss_dir);
    }

    std::filesystem::path render_time_path = result_dir / "render_time.txt";
    std::ofstream out_time(render_time_path);
    out_time << "##[Gaussian Mapper]Render time statistics: keyframe id, time(milliseconds)" << std::endl;

    std::filesystem::path dssim_path = result_dir / "dssim.txt";
    std::ofstream out_dssim(dssim_path);
    out_dssim << "##[Gaussian Mapper]keyframe id, dssim" << std::endl;

    std::filesystem::path psnr_path = result_dir / "psnr.txt";
    std::ofstream out_psnr(psnr_path);
    out_psnr << "##[Gaussian Mapper]keyframe id, psnr" << std::endl;

    std::filesystem::path psnr_gs_path = result_dir / "psnr_gaussian_splatting.txt";
    std::ofstream out_psnr_gs(psnr_gs_path);
    out_psnr_gs << "##[Gaussian Mapper]keyframe id, psnr_gaussian_splatting" << std::endl;


    // Use existing variables
    //cv::Mat imRGBD, imD;
    for (int imageNumber=0; imageNumber<nImages; imageNumber++){
        // Read image and depthmap from file
        imRGB =  cv::imread(std::string(argv[4]) + "/" + vstrImageFilenamesRGB[imageNumber], cv::IMREAD_UNCHANGED);
        cv::cvtColor(imRGB, imRGB, CV_BGR2RGB)
        imDepth = cv::imread(std::string(argv[4]) + "/" + vstrImageFilenamesD[imageNumber], cv::IMREAD_UNCHANGED);

        if (imRGB.empty()) {
            std::cerr << std::endl << "Failed to load image at: "
                << std::string(argv[4]) << "/" << vstrImageFilenamesRGB[imageNumber] << std::endl;
        }
        if (imDepth.empty()) {
            std::cerr << std::endl << "Failed to load depth image at: "
                << std::string(argv[4]) << "/" << vstrImageFilenamesD[imageNumber] << std::endl;
        }
        if (imageScale != 1.f)
        {
            int width = imRGB.cols * imageScale;
            int height = imRGB.rows * imageScale;
            cv::resize(imRGB, imRGB, cv::Size(width, height));
            cv::resize(imD, imD, cv::Size(width, height));
        } 



    }

}


// Method to get poses sequentially

std::vector<Sophus::SE3f> GetPoseSequence() {

    std::vector<Sophus::SE3f> poses;

    // Get all keyframes and sort them
    std::vector<KeyFrame*> vpKFs = mpAtlas->GetAllKeyFrames();
    std::sort(vpKFs.begin(), vpKFs.end(), KeyFrame::lId);

    // Transform all keyframes so that the first keyframe is at the origin.
    // After a loop closure the first keyframe might not be at the origin.
    Sophus::SE3f Two = vpKFs[0]->GetPoseInverse();

    auto lRit = mpTracker->mlpReference.begin();
    auto lT = mpTracker->mlFrameTimes.begin();
    auto lbL = mpTracker->mlbLost.begin();

    for (auto lit = mpTracker->mlRelativeFramePose.begin(),
                lend = mpTracker->mlRelativeFramePoses.end();
                lit != lend; ++lit, ++ lRit, ++ lT, ++lBl) {
        if (*lbl)
            continue; // Skip lost frames

        
        }
}





