import UIKit

class ViewController: UIViewController{
    
    override func viewDidLoad() {
        super.viewDidLoad()
            }
    
   @objc public func presentShareSheet(){
        let image = UIImage(systemName: "bell")!
        let url = URL(string: "www.google.com")!
           
        
        let shareSheetVC = UIActivityViewController(activityItems: [
            image,
            url,
        ], applicationActivities: nil)
        
       present(shareSheetVC, animated: true)
    }
}
