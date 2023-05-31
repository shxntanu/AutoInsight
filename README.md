# AutoInsight
## Computer Vision Model for Detection of Vehicles

We have used YOLOv5 in our project for detection of vehicles in a video / camera feed.

### YOLOv5

<div align="center">
  <p>
    <a align="center" href="https://ultralytics.com/yolov5" target="_blank">
      <img width="100%" src="https://raw.githubusercontent.com/ultralytics/assets/main/yolov5/v70/splash.png"></a>
</p>
</div>

YOLOv5 is a state-of-the-art object detection model developed by Ultralytics. It is an evolution of the YOLO (You Only Look Once) series of real-time object detection models, known for their efficiency and accuracy. YOLOv5 builds upon the success of its predecessors, such as YOLOv4 and YOLOv3, and introduces several improvements.

Some key features and characteristics of YOLOv5:

- **Architecture**: YOLOv5 follows a single-shot detection approach, where an input image is divided into a grid, and each grid cell predicts bounding boxes and class probabilities. It utilizes a deep convolutional neural network (CNN) backbone for feature extraction and applies anchor-based detection to predict object locations.
- **Variants:** YOLOv5 comes in different variants, namely YOLOv5s, YOLOv5m, YOLOv5l, and YOLOv5x. These variants differ in terms of model size and computational complexity, with YOLOv5s being the smallest and fastest, and YOLOv5x being the largest and most accurate.
- **Object Detection:** YOLOv5 is capable of detecting a wide range of objects in real-time, including vehicles, pedestrians, animals, and various everyday objects. It performs object detection by predicting bounding boxes (coordinates of the object's location) and class probabilities (likelihood of the object belonging to a specific class) for each object instance in an image.
- **Accuracy and Speed:** YOLOv5 achieves an excellent balance between accuracy and speed. It has been optimized to deliver high-quality object detection results while maintaining real-time or near real-time performance, making it suitable for applications that require fast processing, such as video analysis and surveillance systems.
- **Training and Customization:** YOLOv5 can be trained on custom datasets to detect specific objects of interest. It supports transfer learning, allowing you to start with a pre-trained model on a large dataset (like the COCO dataset) and fine-tune it on your specific dataset. This makes it easier to apply YOLOv5 to various object detection tasks, including vehicle detection.
- **Implementation:** YOLOv5 is implemented using popular deep learning frameworks such as PyTorch. It provides a user-friendly and flexible interface for training and inference, allowing developers and researchers to experiment with different configurations, model sizes, and datasets.

When applied to vehicle detection in video or camera feeds, YOLOv5 can accurately identify and track vehicles, providing valuable information for traffic analysis, autonomous driving systems, surveillance, and other related applications.

### YOLOv5 Internal Architecture

<img src= "https://www.yuthon.com/images/YOLO_the_architecture.png">

### Training
[(ref)](https://www.yuthon.com/post/papers/notes-for-yolo/)

In order to make the whole network have better performance, YOLO uses the following tricks:
- The first 20 convolutional layers use ImageNet for pretraining, and the last 4 convolutional layers and two fully connected layers are randomly initialized
- Change the resolution of the input image from ```224 x 224``` to ```448 x 448```
- The last layer (output layer) uses a linear activation function, and the other layers use Leaky ReLU.
- The loss function uses sum-squared error.
- The entire loss function is as follows:
<img src="https://www.yuthon.com/images/YOLO_loss_function.png" height = 450px>

### Limitations of YOLO
- Since YOLO has only One Bounding Box and one Class, thus limiting the number of detected nearby objects.
- The generalization ability is not enough. Due to the large number of downsampling, only coarser features can be used.
- The main source of the loss function is the positioning error, and it needs to be improved in the balance of the position error of large and small objects.






