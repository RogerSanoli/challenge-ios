//
//  UIImageViewExtension.swift
//
//  Copyright (c) 2018 Roger dos Santos Oliveira
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
//

/*import Foundation

private var taskKey: UInt8 = 10
private var pathHashValueKey: UInt8 = 11

public extension UIImageView {
    fileprivate var task: URLSessionDataTask? {
        get {
            return objc_getAssociatedObject(self, &taskKey) as? URLSessionDataTask
        }
        set {
            if let newValue = newValue {
                objc_setAssociatedObject(self, &taskKey, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
            }
        }
    }
    
    fileprivate var pathHashValue: Int? {
        get {
            return objc_getAssociatedObject(self, &pathHashValueKey) as? Int
        }
        set {
            if let newValue = newValue {
                objc_setAssociatedObject(self, &pathHashValueKey, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
            }
        }
    }

    func download(_ path: String?, crossDissolve: Bool = true, placeholder: UIImage? = nil) {
        guard pathHashValue != path?.hashValue,
        let pathStr = path,
        let url = URL(string: pathStr)
        else {
            return
        }
        
        pathHashValue = path?.hashValue
        DispatchQueue.safeSync { self.image = placeholder }
        
        task?.cancel()
        task = RogueKit.downloadImage(from: url, completion: { [weak self] (result) in
            guard self?.pathHashValue == path?.hashValue else {
                return
            }
            
            self?.task = nil
            
            if case let .success(image) = result {
                DispatchQueue.safeSync {
                    if crossDissolve {
                        if let safeSelf = self {
                            UIView.transition(with: safeSelf, duration: 0.25, options: .transitionCrossDissolve, animations: {
                                safeSelf.image = image
                            })
                        }
                    } else {
                        self?.image = image
                    }
                }
            }
        })
    }
    
    func cancelDownload() {
        task?.cancel()
        task = nil
    }
}*/
