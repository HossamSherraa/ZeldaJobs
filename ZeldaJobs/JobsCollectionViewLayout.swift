//
//  JobsCollectionViewLayout.swift
//  ZeldaJobs
//
//  Created by Hossam on 29/04/2021.
//

import UIKit
class JobsCollectionViewlayout : UICollectionViewLayout {
    var attributes : [UICollectionViewLayoutAttributes] = []
    var contentSize : CGSize = .zero
    let itemWidth : CGFloat = 231
    let itemHeight : CGFloat = 309
    let spacing: CGFloat = -10
    let leadingSafeArea : CGFloat = 231
   var isFirstLoad = true
   
    override var collectionViewContentSize: CGSize {
        return .init(
            width: (itemWidth + spacing) * CGFloat(collectionView!.numberOfItems(inSection: 0)) + leadingSafeArea*2  ,
            height: itemHeight)
    }
    
    override func prepare() {
        super.prepare()
        attributes.removeAll()
        collectionView?.decelerationRate = .fast
        var xValue : CGFloat = itemWidth
        let offestPerItem = (collectionViewContentSize.width - itemWidth*2) / CGFloat(collectionView!.numberOfItems(inSection: 0))
        for item in 0..<collectionView!.numberOfItems(inSection: 0) {
            let indexPath = IndexPath(item: item, section: 0)
            let attribute = UICollectionViewLayoutAttributes(forCellWith: indexPath)
            attribute.frame = .init(x: xValue, y: 0, width: itemWidth, height: itemHeight)
            
            let currentItemOffset =  CGFloat(item) * offestPerItem
            let centerOfViewOffset = (collectionView!.bounds.width / 2) - (itemWidth / 2) + collectionView!.contentOffset.x - itemWidth
            let currentRatio =  abs(currentItemOffset - centerOfViewOffset) / 1000
            //When 0
             let scaleValue = abs(1 - currentRatio)
           
            attribute.transform = .init(scaleX: scaleValue, y: scaleValue)
            
            xValue += spacing + itemWidth

            attributes.append(attribute)
        }
        
        if isFirstLoad {
            collectionView?.setContentOffset(.init(x:attributes.first!.frame.origin.x / 2 , y:0), animated: false )
            isFirstLoad = false
        }
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
