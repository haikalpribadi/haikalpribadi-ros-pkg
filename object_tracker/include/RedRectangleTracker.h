/* 
 * File:   RedRectangleTracker.h
 * Author: haikalpribadi
 *
 * Created on July 12, 2012, 6:58 PM
 */

#ifndef REDRECTANGLETRACKER_H
#define	REDRECTANGLETRACKER_H

#include <ros/ros.h>
#include <math.h>
#include <image_transport/image_transport.h>
#include <sensor_msgs/image_encodings.h>
#include <cv_bridge/cv_bridge.h>
#include <opencv2/core/core.hpp>
#include <opencv2/imgproc/imgproc.hpp>
#include <opencv2/highgui/highgui.hpp>

#define windowname "Square detection demo"

class RedRectangleTracker {
public:
    RedRectangleTracker();
    virtual ~RedRectangleTracker();
private:
    ros::NodeHandle node_handle_;
    image_transport::ImageTransport img_transport_;
    image_transport::Subscriber img_sub_;
    int thresh, N;

    void imageCallback(const sensor_msgs::ImageConstPtr& message);
    double angle(cv::Point pt1, cv::Point pt2, cv::Point pt0);
    void findSquares(const cv::Mat& image, std::vector<std::vector<cv::Point> >& squares);
    void drawSquares(cv::Mat& image, const std::vector<std::vector<cv::Point> >& squares);
};

#endif	/* REDRECTANGLETRACKER_H */

