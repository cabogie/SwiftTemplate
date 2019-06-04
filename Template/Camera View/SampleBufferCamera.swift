//
//  Camera+SampleBuffer.swift
//  Distortvid
//
//  Created by Chris Bogie on 2019-05-31.
//  Copyright © 2019 Chris Bogie. All rights reserved.
//

import Foundation
import AVKit

class SampleBuffer {
    
    private weak var camera: Camera?
    private var videoDataOuput: AVCaptureVideoDataOutput?
    
    init(camera: Camera, sampleBufferDelegate: AVCaptureVideoDataOutputSampleBufferDelegate, queue: DispatchQueue){
        self.camera = camera
        self.setSampleBufferDelegate(sampleBufferDelegate, queue: queue)
    }
    
    func setSampleBufferDelegate(_ delegate:AVCaptureVideoDataOutputSampleBufferDelegate?, queue: DispatchQueue){
        
        if let camera = camera {
            camera.captureSession.beginConfiguration()
            
            do {
                camera.removeOutput(videoDataOuput)
                
                let newOutput = AVCaptureVideoDataOutput()
                newOutput.alwaysDiscardsLateVideoFrames = true
                newOutput.setSampleBufferDelegate(delegate, queue: queue)
                
                // add the new output
                if camera.addOutput(videoDataOuput) {
                    videoDataOuput = newOutput
                }
                
                if let videoConnection = videoDataOuput?.connection(with: .video) {
                    videoConnection.videoOrientation = .portrait
                    if videoConnection.isVideoStabilizationSupported {
                        videoConnection.preferredVideoStabilizationMode = .standard
                    }
                    if camera.device?.position == .front {
                        videoConnection.isVideoMirrored = true
                    }
                }
            }
            
            camera.captureSession.commitConfiguration()
        }
    }
    
    
}
