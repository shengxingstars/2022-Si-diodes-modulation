import tensorflow as tf
import deeplabcut
import os
from pathlib import Path
deeplabcut.create_new_project('6315','hrq', [r'C:\Users\Administrator\Desktop\video\6315.mp4'],copy_videos=True,multianimal=True)
config_path=r'C:\Users\Administrator\Desktop\6315.mp4DLC_resnet50_jan16\config.yaml'
deeplabcut.extract_frames(config_path, mode='automatic', algo='kmeans', crop=False)
deeplabcut.label_frames(config_path)
deeplabcut.check_labels(config_path)
deeplabcut.create_training_dataset(config_path)
deeplabcut.train_network(config_path)
deeplabcut.evaluate_network(config_path,plotting=True)
videoPath=[r'C:\Users\Administrator\Desktop\6315.mp4DLC_resnet50_jan16\videos\video1.mp4']
deeplabcut.analyze_videos(config_path,videoPath,save_as_csv=True)
deeplabcut.create_labeled_video(config_path, videoPath,filtered=True,draw_skeleton=True)
deeplabcut.plot_trajectories(config_path,videoPath,showfigures=True)