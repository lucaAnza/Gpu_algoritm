/**
* This file is part of Cuda accelerated ORB-SLAM project by Filippo Muzzini, Nicola Capodieci, Roberto Cavicchioli and Benjamin Rouxel.
 * Implemented by Filippo Muzzini.
 *
 * Based on ORB-SLAM2 (Raúl Mur-Artal, José M.M. Montiel and Juan D. Tardós) and ORB-SLAM3 (Carlos Campos, Richard Elvira, Juan J. Gómez Rodríguez, José M.M. Montiel and Juan D. Tardós)
 *
 * Project under GPLv3 Licence
*
*/

#ifndef GPU_STEREOMATCHES
#define GPU_STEREOMATCHES

#include <opencv2/core/hal/interface.h>
#include <vector>
#include <opencv2/features2d.hpp>



void gpu_stereoMatches(int time_calls , std::vector<std::vector<size_t>> vRowIndices , std::vector<cv::KeyPoint> mvKeys , std::vector<cv::KeyPoint> mvKeysRight , float minZ , float minD , float maxD , int TH_HIGH , int thOrbDist , cv::Mat mDescriptors , cv::Mat mDescriptorsRight ,
                        std::vector<float> mvInvScaleFactors , std::vector<float> mvScaleFactors , std::vector<size_t> size_refer ) ;


#endif


