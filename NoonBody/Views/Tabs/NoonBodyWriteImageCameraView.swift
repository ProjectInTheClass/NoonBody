//
//  NoonBodyWriteImageCameraView.swift
//  NoonBody
//
//  Created by 윤진영 on 2020/10/07.
//

import SwiftUI

struct NoonBodyWriteImageCameraView: View {
    @State private var showYPImagePickerView = true

        var body: some View {
            VStack {
                Button(action: {
                    self.showYPImagePickerView.toggle()
                }, label: { Text("Show Square").font(.title) })

                if showYPImagePickerView {
                    YPImagePickerView()
                }
            }

        }
}

struct YPImagePickerView: UIViewControllerRepresentable
{
    func makeUIViewController(context: Context) -> YPImagePickerViewController {
        let vc =  YPImagePickerViewController()
        print("\nmakeUIViewController \(vc)")
        return vc
    }

    func updateUIViewController(_ uiViewController: YPImagePickerViewController, context: Context) {
        print("updateUIViewController \(uiViewController)")
    }

    static func dismantleUIViewController(_ uiViewController: YPImagePickerViewController, coordinator: Self.Coordinator) {
        print("dismantleUIViewController \(uiViewController)")
    }

}

class YPImagePickerViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.green
        print("viewDidLoad \(self)")
        let picker = YPImagePicker()
        picker.didFinishPicking { [unowned picker] items, _ in
        if let photo = items.singlePhoto {
            print(photo.fromCamera) // Image source (camera or library)
            print(photo.image) // Final image selected by the user
            print(photo.originalImage) // original image selected by the user, unfiltered
            print(photo.modifiedImage) // Transformed image, can be nil
            print(photo.exifMeta) // Print exif meta data of original image.
    }
    picker.dismiss(animated: true, completion: nil)
}
present(picker, animated: true, completion: nil)
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("viewWillDissapear \(self)")
    }

    deinit {
        print("DEINIT \(self)")
    }

}
