//
//  TimelineViewController.swift
//  Framgia
//
//  Created by  on 11/17/17.
//  Copyright © 2017 Framgia. All rights reserved.
//

import UIKit

class TimelineViewController: BaseViewController, NavigationHandle {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setupNavigation()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    func setupNavigation() {
        initNavigtionBarSearch()
        myNavigationBar?.updateTitle("TimeLine")
        myNavigationBar?.delegate = self
        myNavigationBar?.hiddenOrtherButton(true)
    }
    //MARK: Navigation delegate
    func clickLeftMenu(_ sender: AnyObject) {
        
    }
    
    func clickRightMenu(_ sender: AnyObject) {
    }
    
    func clickOtherMenu(_ sender: AnyObject) {
        
    }
    

}
