//
//  JobsCollectionViewLayout.swift
//  ZeldaJobs
//
//  Created by Hossam on 29/04/2021.
//

import UIKit
class JobsCollectionViewlayout : UICollectionViewLayout {
    private var attributes : [UICollectionViewLayoutAttributes] = []
    private var contentSize : CGSize = .zero
    private let itemWidth : CGFloat = 231
    private let itemHeight : CGFloat = 309
    private let spacing: CGFloat = -10
    private let leadingSafeArea : CGFloat = 231
    private var isFirstLoad = true
   
    override var collectionViewContentSize: CGSize {
        return .init(
            width: (itemWidth + spacing) * CGFloat(collectionView!.numberOfItems(inSection: 0)) + leadingSafeArea*2  ,
            height: itemHeight)
    }
    
    private lazy var offestPerItem = (collectionViewContentSize.width - itemWidth*2) / CGFloat(collectionView!.numberOfItems(inSection: 0))
    override func prepare() {
        super.prepare()
        attributes.removeAll()
        var xValue : CGFloat = itemWidth
        for item in 0..<collectionView!.numberOfItems(inSection: 0) {
            let attribute = createAttributeForIndex(item: item)
            let scaleValue = getScaleValue( index: item)
            let frame = CGRect.init(x: xValue, y: 0, width: itemWidth, height: itemHeight)
            attribute.setAttributesValues(scaleValue: scaleValue, frame: frame)
            xValue += spacing + itemWidth
            attributes.append(attribute)
        }
        
        if isFirstLoad {
            configCollectionViewForFirstLoad()
            isFirstLoad = false
        }
    }
    
   private  func createAttributeForIndex(item : Int)->UICollectionViewLayoutAttributes {
        let indexPath = IndexPath(item: item, section: 0)
        let attribute = UICollectionViewLayoutAttributes(forCellWith: indexPath)
        return attribute
    }
     func configCollectionViewForFirstLoad(){
        collectionView!.decelerationRate = .fast
        collectionView!.setContentOffset(.init(x:attributes[1].center.x , y:0), animated: false )
    }
    
   private  func getScaleValue( index : Int)->CGFloat{
        let currentItemOffset =  CGFloat(index) * offestPerItem
        let centerOfViewOffset = (collectionView!.bounds.width / 2) - (itemWidth / 2) + collectionView!.contentOffset.x - itemWidth
        let currentRatio =  abs(currentItemOffset - centerOfViewOffset) / 1000
         return abs(1 - currentRatio)
    }
    
     override func shouldInvalidateLayout(forBoundsChange newBounds: CGRect) -> Bool {
        true
    }
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        return attributes
    }
    override func layoutAttributesForItem(at indexPath: IndexPath) -> UICollectionViewLayoutAttributes? {
        attributes[indexPath.row]
    }
    override func targetContentOffset(forProposedContentOffset proposedContentOffset: CGPoint, withScrollingVelocity velocity: CGPoint) -> CGPoint {
        let targetItem =   attributes.sorted(by: {abs($0.center.x - proposedContentOffset.x) < abs($1.center.x - proposedContentOffset.x)}).first!
        return targetItem.center
    }
    
   
}

extension UICollectionViewLayoutAttributes {
    func setAttributesValues(scaleValue : CGFloat , frame : CGRect){
        self.frame = frame
        self.transform = .init(scaleX: scaleValue, y: scaleValue)
    }
}
