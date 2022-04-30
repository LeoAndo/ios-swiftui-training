//
//  ImagePickerView.swift
//  MyCamera
//
//  Created by LeoAndo on 2022/04/30.
//

import SwiftUI

struct ImagePickerView: UIViewControllerRepresentable {
    @Binding var isShowSheet: Bool
    @Binding var captureImage: UIImage?
    
    class Coordinator: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
        let parent: ImagePickerView
        
        init(_ parent: ImagePickerView) {
            self.parent = parent
        }
        // 撮影が終わった時に呼ばれる
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]){
            //撮影画像を保存
            if let originalImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
                parent.captureImage = originalImage
            }
            parent.isShowSheet = false
        }
        // キャンセル時
        func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
            parent.isShowSheet = false
        }
    }
    
    // SwiftUIによって自動的に呼び出し
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    func makeUIViewController(context: UIViewControllerRepresentableContext<ImagePickerView>) ->  UIImagePickerController {
        let myImagePickerController = UIImagePickerController()
        myImagePickerController.sourceType = .camera
        myImagePickerController.delegate = context.coordinator
        return myImagePickerController
    }
    
    func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context) {
        print("updateUIViewController")
        //処理なし
    }
}
