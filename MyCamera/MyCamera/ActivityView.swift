//
//  ActivityView.swift
//  MyCamera
//
//  Created by LeoAndo on 2022/04/30.
//

import SwiftUI

struct ActivityView: UIViewControllerRepresentable {
    // （シェア機能）でシェアする写真
    let shareItems: [Any]
    
    // 表示するViewを生成するときに実行
    func makeUIViewController(context: Context) ->
        UIActivityViewController {
        
        // UIActivityViewControllerでシェアする機能を生成
        let controller = UIActivityViewController(
                        activityItems: shareItems,
                        applicationActivities: nil)
        return controller
    }
    
    // Viewが更新されたときに実行
    func updateUIViewController(
        _ uiViewController: UIActivityViewController,
        context: UIViewControllerRepresentableContext<ActivityView>)
    {
        // 処理なし
    }
}
