//
//  ViewController.swift
//  MathJAx
//
//  Created by Keke Arif on 22/11/2016.
//  Copyright © 2016 Keke Arif. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var webview: UIWebView!
    var path: String!
    var baseURL: URL!

    override func viewDidLoad() {
        
        super.viewDidLoad()
        path = Bundle.main.bundlePath
        baseURL = NSURL.fileURL(withPath: path)
        let myHTML = convertLatexForWebview(latex: "\\frac{-b\\pm\\sqrt{b^2-4ac}}{2a} \\text{ Please enter some text} \\\\ \\text{ Enter some more silly!}", fontSize: 30)
        webview.loadHTMLString(myHTML, baseURL:baseURL)
        webview.layer.cornerRadius = 4.0
        webview.layer.borderColor = UIColor.blue.cgColor
        webview.layer.borderWidth = 1.0
        webview.delegate = self
        //Need a callback for the resize and view
        //perform(#selector(resizeAfterDelay), with: nil, afterDelay: 3.0)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    @IBAction func sliderChanged(_ sender: UISlider) {
        let newFontSize = Int(sender.value)
        let newHTML = convertLatexForWebview(latex: "\\frac{-b\\pm\\sqrt{b^2-4ac}}{2a} \\text{ Please enter some text} \\\\ \\text{ Enter some more silly!}", fontSize: newFontSize)
        webview.loadHTMLString(newHTML, baseURL:baseURL)
    }
    
    func convertLatexForWebview(latex: String, fontSize: Int) -> String {
        return "<!DOCTYPE html><html><head><title>MathJax TeX Test Page</title><script type=\"text/javascript\" async  src=\"MathJax-2.7.0/MathJax.js?config=TeX-AMS_CHTML\"></script></head><body>  <div style=\"font-size: \(fontSize)pt; color: #000;\">$$\(latex)$$</div></body></html>"
    }
    
    func resizeAfterDelay() {
        webview.sizeToFit()
    }

}

extension ViewController: UIWebViewDelegate {
    
    func webView(_ webView: UIWebView, shouldStartLoadWith request: URLRequest, navigationType: UIWebViewNavigationType) -> Bool {
        return true
    }
}

