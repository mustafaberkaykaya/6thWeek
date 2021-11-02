//
//  ViewController.swift
//  6thWeek
//
//  Created by Mustafa Berkay Kaya on 2.11.2021.
//

import UIKit

class ViewController: UIViewController, UIScrollViewDelegate {

    @IBOutlet private weak var slideScrollView: UIScrollView!
    @IBOutlet private weak var pageControl: UIPageControl!
    
    private var  slides = [Slide]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        slideScrollView.delegate = self
        
        let slides: [Slide] = createSlides()
        setupSlideScrollView(slides: slides)
        
        pageControl.numberOfPages = slides.count
        pageControl.currentPage = 0
        view.bringSubviewToFront(pageControl)
   
    }
    
    private func createSlides() -> [Slide] {
        
        if let slide1 = Bundle.main.loadNibNamed("Slide", owner: self, options: nil)?.first as? Slide {
            slide1.setLabel().text = "View 1"
            slides.append(slide1)
        }
        
        if let slide2 = Bundle.main.loadNibNamed("Slide", owner: self, options: nil)?.first as? Slide {
            slide2.setLabel().text = "View 2"
            slide2.backgroundColor = .red
            slides.append(slide2)
        }
        
        if let slide3 = Bundle.main.loadNibNamed("Slide", owner: self, options: nil)?.first as? Slide {
            slide3.setLabel().text = "View 3"
            slide3.backgroundColor = .green
            slides.append(slide3)
        }
        
        return slides
     
    }
    
    private func setupSlideScrollView(slides: [Slide]) {
        slideScrollView.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height)
        slideScrollView.contentSize = CGSize(width: view.frame.width * CGFloat(slides.count), height: view.frame.height)
        
        for slide in 0..<slides.count {
            slides[slide].frame = CGRect(x: view.frame.width * CGFloat(slide), y: 0, width: view.frame.width, height: view.frame.height)
            slideScrollView.addSubview(slides[slide])
        }
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let pageIndex = round(scrollView.contentOffset.x / view.frame.width)
        pageControl.currentPage = Int(pageIndex)
    }
}
 
