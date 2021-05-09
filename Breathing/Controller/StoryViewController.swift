//
//  StoryViewViewController.swift
//  Breathing
//
//  Created by Jackie Leonardy on 30/04/21.
//

import UIKit

class StoryViewController: UIViewController {

    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var collectionStoryView: UICollectionView!
    @IBOutlet weak var skipBtn: UIButton!
    
    var currentPage = 0 {
        didSet {
            if currentPage == slides.count - 1{
                skipBtn.setTitle("Start", for: .normal)
            }
        }
    }
    var slides: [StorySlide] = StorySlide.getStory()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pageControl.numberOfPages = slides.count
        collectionStoryView.delegate = self
        collectionStoryView.dataSource = self
        // Do any additional setup after loading the view.
    }
    
    
    
}

extension StoryViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return slides.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: StoryCollectionViewCell.identifier, for: indexPath) as! StoryCollectionViewCell
        
        cell.setup(slides[indexPath.row])
        print(cell.bigTitle.text!)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let width = scrollView.frame.width
        currentPage = Int(scrollView.contentOffset.x / width)
        print(width)
        print(scrollView.contentOffset.x)
        print(currentPage)
        pageControl.currentPage = currentPage
    }
    
}

extension StoryViewController{
    @IBAction func skipTapped(_ sender: UIButton) {
        performSegue(withIdentifier: "skipSegue", sender: nil
        )
    }
}
