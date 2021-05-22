# import numpy as np
# import cv2


# def run():

#     def dummy_inference(x):
#         """invert an image"""
#         return 255-x      

#     cap = cv2.VideoCapture(0)                 # your webcam

#     while True:                               # forever
#         ret, frame_in = cap.read()            # 1. read frame
#         frame_out = dummy_inference(frame_in) # 2. process frame
#         cv2.imshow('frame', frame_out)        # 3. display frame
#         # logic for conditional termination of the loop...
        
# if __name__ == "__main__":
#     run()

import cv2

cap = cv2.VideoCapture(0)

# Check if the webcam is opened correctly
if not cap.isOpened():
    raise IOError("Cannot open webcam")

while True:
    ret, frame = cap.read()
    frame = cv2.resize(frame, None, fx=0.5, fy=0.5, interpolation=cv2.INTER_AREA)
    cv2.imshow('Input', frame)

    c = cv2.waitKey(1)
    if c == 27:
        break

cap.release()
cv2.destroyAllWindows()