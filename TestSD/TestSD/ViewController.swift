//
//  ViewController.swift
//  Kingfisher-Demo
//
//  Created by Wei Wang on 15/4/6.
//
//  Copyright (c) 2018 Wei Wang <onevcat@gmail.com>
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.

import UIKit

class ViewController: UICollectionViewController {

  private var _datas: [String] = []

  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
    title = "Kingfisher"

    if #available(iOS 10.0, tvOS 10.0, *) {
      collectionView?.prefetchDataSource = self
    }

    SDWebImageManager.shared().imageCache?.maxMemoryCost = 50 * 1024
//    KingfisherManager.shared.cache.maxMemoryCost = 30 * 1024

    let datas = [
      "https://wt-box.worktile.com/thumb/1d7e3427-4ffa-435d-a811-21c26f62ad85_480x360.png",
      "https://wt-box.worktile.com/thumb/af024523-8c88-4887-84ce-9e24aff4d54e_480x360.gif",
      "https://wt-box.worktile.com/thumb/a31d85ac-5e40-42e0-9afc-9f80152c1fb5_480x360.gif",
      "https://wt-box.worktile.com/thumb/56a3160b-d533-4005-81ed-720e45d75323_480x360.gif",
      "https://wt-box.worktile.com/thumb/47087700-dd37-46ae-b047-cd82e6adafe3_480x360.gif",
      "https://wt-box.worktile.com/thumb/3fa2d0b4-ac63-4a3f-9622-35951864fe5a_480x360.gif",
      "https://wt-box.worktile.com/thumb/ee5f9da8-93dc-4287-bfb7-c01ee52d1762_480x360.gif",
      "https://wt-box.worktile.com/thumb/5d64dfca-254d-4fb5-ba4d-dd2cac00750c_480x360.gif",
      "https://wt-box.worktile.com/thumb/a00a9e22-29af-4e70-a28e-309498a172f2_480x360.gif",
      "https://wt-box.worktile.com/thumb/3fa2d0b4-ac63-4a3f-9622-35951864fe5a_480x360.gif",
      "https://wt-box.worktile.com/thumb/4677ca34-f994-4c9a-b76a-fb15bec18f0e_480x360.gif",
      "https://wt-box.worktile.com/thumb/ef2e1868-34d8-4207-8fa4-cfc95638420e_480x360.gif"
    ]

    for _ in 0..<10 {
      _datas += datas
    }
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }

  @IBAction func clearCache(sender: AnyObject) {
//    KingfisherManager.shared.cache.clearMemoryCache()
//    KingfisherManager.shared.cache.clearDiskCache()
  }

  @IBAction func reload(sender: AnyObject) {
    collectionView?.reloadData()
  }
}

extension ViewController {
  override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return _datas.count
  }

//  override func collectionView(_ collectionView: UICollectionView, didEndDisplaying cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
//    // This will cancel all unfinished downloading task when the cell disappearing.
//    (cell as! CollectionViewCell).cellImageView.kf.cancelDownloadTask()
//  }

//  override func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
//
//    //        let url = URL(string: "https://raw.githubusercontent.com/onevcat/Kingfisher/master/images/kingfisher-\(indexPath.row + 1).jpg")!
//    let url = URL(string: _datas[indexPath.row])!
//
//    _ = (cell as! CollectionViewCell).cellImageView.kf.setImage(with: url,
//                                                                placeholder: nil,
//                                                                options: [.transition(ImageTransition.fade(1))],
//                                                                progressBlock: { receivedSize, totalSize in
//                                                                  print("\(indexPath.row + 1): \(receivedSize)/\(totalSize)")
//    },
//                                                                completionHandler: { image, error, cacheType, imageURL in
//                                                                  print("\(indexPath.row + 1): Finished")
//    })
//  }

  override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "collectionViewCell", for: indexPath) as! CollectionViewCell
    cell.cellImageView.sd_setImageAsyncWithURL(URL(string: _datas[indexPath.row]), placeholderImage: nil, options: .highPriority)
//      .sd_setImage(with: URL(string: _datas[indexPath.row]), completed: nil)
//    cell.cellImageView.kf.indicatorType = .activity
    return cell
  }
}

extension ViewController: UICollectionViewDataSourcePrefetching {
  func collectionView(_ collectionView: UICollectionView, prefetchItemsAt indexPaths: [IndexPath]) {

  }

//  func collectionView(_ collectionView: UICollectionView, prefetchItemsAt indexPaths: [IndexPath]) {
//    //        let urls = indexPaths.compactMap {
//    //            URL(string: "https://raw.githubusercontent.com/onevcat/Kingfisher/master/images/kingfisher-\($0.row + 1).jpg")
//    //        }
//    let urls = indexPaths.compactMap {_ in
//      URL(string: "https://wt-box.worktile.com/thumb/af024523-8c88-4887-84ce-9e24aff4d54e_480x360.gif")
//    }
//    ImagePrefetcher(urls: urls).start()
//  }
}


// Inspired by: https://fdp.io/blog/2018/03/22/supporting-compactmap-in-swift-4/
#if swift(>=4.1)
// This is provided by the stdlib
#else
extension Sequence {
func compactMap<T>(_ transform: (Self.Element) throws -> T?) rethrows -> [T] {
return try flatMap(transform)
}
}
#endif


extension FLAnimatedImageView {

  // 图片为 GIF 时，转成 FLAnimatedImage 放到了异步线程， sd_setImage 是把此步放到主线程的，滚动时会卡,因此重写了此方法
  func sd_setImageAsyncWithURL(_ URL: Foundation.URL?,
                               placeholderImage: UIImage?,
                               options: SDWebImageOptions,
                               progress: SDWebImageDownloaderProgressBlock?=nil,
                               completed: SDExternalCompletionBlock?=nil) {
    sd_internalSetImage(with: URL,
                        placeholderImage: placeholderImage,
                        options: options,
                        operationKey: nil,
                        setImageBlock: { [weak self](image: UIImage?, imageData: Data?) in
                          guard let strongSelf = self else { return }
                          // Step 1. Check memory cache (associate object)
                          let associatedAnimatedImage: FLAnimatedImage? = image?.sd_FLAnimatedImage
                          if associatedAnimatedImage != nil {
                            strongSelf.animatedImage = associatedAnimatedImage
                            strongSelf.image = nil
                            return
                          }

                          // Step 2. Check if original compressed image data is "GIF"
                          let isGIF = image?.sd_imageFormat == .GIF || NSData.sd_imageFormat(forImageData: imageData) == .GIF
                          if !isGIF {
                            strongSelf.image = image
                            strongSelf.animatedImage = nil
                            return
                          }

                          // Step 3. Check if data exist or query disk cache
                          var tempImageDta = imageData
                          if imageData == nil {
                            let key = SDWebImageManager.shared().cacheKey(for: URL)
                            tempImageDta = SDWebImageManager.shared().imageCache?.diskImageData(forKey: key)
                          }
                          // Step 4. Create FLAnimatedImage
                          DispatchQueue.global().async { [weak self] in
                            let animatedImage = FLAnimatedImage(animatedGIFData: tempImageDta,
                                                                optimalFrameCacheSize: 0,
                                                                predrawingEnabled: false)
                            // Step 5. Set animatedImage or normal image
                            DispatchQueue.main.async { [weak self] in
                              guard let strongSelf = self else { return }
                              if animatedImage != nil {
                                if strongSelf.sd_cacheFLAnimatedImage {
                                  image?.sd_FLAnimatedImage = animatedImage
                                }
                                strongSelf.animatedImage = animatedImage
                                strongSelf.image = nil
                              } else {
                                strongSelf.animatedImage = nil
                                strongSelf.image = image
                              }
                            }
                          }
      }, progress: progress, completed: completed)
  }
}
