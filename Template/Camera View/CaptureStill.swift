//
//  CaptureStill.swift
//  Distortvid
//
//  Created by Chris Bogie on 2019-05-31.
//  Copyright © 2019 Chris Bogie. All rights reserved.
//

import Foundation
import AVKit

class CaptureStillAccessory : NSObject, CameraOutputAccessory, AVCapturePhotoCaptureDelegate {
    func output(for camera: Camera) -> AVCaptureOutput {
        return cameraOutput
    }
    
    func cameraAccessoryWillAttachOutput(to camera: Camera) { }
    func cameraAccessoryDidAttachOutput(to camera: Camera) { }
    func cameraAccessoryFailedToAttachOutput() { }
    
    private let cameraOutput = AVCapturePhotoOutput()
    fileprivate var handler: ((UIImage?) -> Void)?
    
    init (delegate: CaptureStillDelegate) {
        
    }
    
    func capture(flashMode:AVCaptureDevice.FlashMode, imageHandler: @escaping (UIImage?) -> Void) {
        
        handler = imageHandler
        
        let settings = AVCapturePhotoSettings()
        let previewPixelType = settings.availablePreviewPhotoPixelFormatTypes.first!
        let previewFormat = [kCVPixelBufferPixelFormatTypeKey as String: previewPixelType,
                             kCVPixelBufferWidthKey as String: 160,
                             kCVPixelBufferHeightKey as String: 160]
        settings.previewPhotoFormat = previewFormat
        
        if camera.device?.hasFlash ?? false {
            settings.flashMode = flashMode
        }
        
        self.cameraOutput.capturePhoto(with: settings, delegate: self)
    }
    
    func photoOutput(_ output: AVCapturePhotoOutput, didFinishProcessingPhoto photo: AVCapturePhoto, error: Error?) {
        
        if let error = error {
            print("error occured : \(error.localizedDescription)")
        }
        
        if let dataImage = photo.fileDataRepresentation() {
            print(UIImage(data: dataImage)?.size as Any)
            
            let dataProvider = CGDataProvider(data: dataImage as CFData)
            let cgImageRef: CGImage! = CGImage(jpegDataProviderSource: dataProvider!, decode: nil, shouldInterpolate: true, intent: .defaultIntent)
            let image = UIImage(cgImage: cgImageRef, scale: 1.0, orientation: UIImage.Orientation.right)
            
            handler?(image)
            handler = nil
            
        } else {
            print("some error here")
        }
        
    }

}
