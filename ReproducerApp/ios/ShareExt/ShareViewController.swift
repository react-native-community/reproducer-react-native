import UIKit
import Social
import React

class ShareViewController: UIViewController {


  override func viewDidLoad() {
    super.viewDidLoad()


    let bundleUrl = self.getBundleURL()
    print("Bundle URL: \(bundleUrl)")

   let rootView = RCTRootView(
     bundleURL: bundleUrl,
     moduleName: "IssuerUIExtension",
     initialProperties: nil,
     launchOptions: nil
   )
    
    // Initialize the Fabric surface
    // let surface = RCTFabricSurface(
    //     moduleName: "IssuerUIExtension",
    //     initialProperties: [:]
    // )

    // Create a hosting view for the Fabric surface
    // let rootView = RCTSurfaceHostingProxyRootView(surface: surface)

    // Start the surface (loads the JS bundle)
    // surface.start(withBundleURL: bundleUrl, launchOptions: nil)

    
    ExtensionContextProviderImpl.shared().setExtensionContext(self.extensionContext)


    self.view.addSubview(rootView)
    rootView.frame = self.view.bounds
  }

  override func viewDidDisappear(_ animated: Bool) {
      super.viewDidDisappear(animated)
  }
  
  func getBundleURL() -> URL {
      #if DEBUG
        RCTBundleURLProvider.sharedSettings().jsBundleURL(forBundleRoot: "index.IssuerUIExtension")!
      #else
        Bundle.main.url(forResource: "main", withExtension: "jsbundle")!
      #endif
    }
}

