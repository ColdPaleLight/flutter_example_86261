import UIKit
import Flutter

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  var flutterViewControllerA : FlutterViewController?;
  var flutterViewControllerB : FlutterViewController?;
  var engine : FlutterEngine?;
    
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    GeneratedPluginRegistrant.register(with: self)
    let result = super.application(application, didFinishLaunchingWithOptions: launchOptions)
    setup();
    return result;
  }
    
  func setup() {
    
    
    let controller = self.window.rootViewController;
    self.flutterViewControllerA = controller as? FlutterViewController;
    self.engine = self.flutterViewControllerA?.engine;

    let view  = UIView();
    view.frame = CGRect(origin: CGPoint(x:0,y:100), size: CGSize(width:300,height:50));
    view.backgroundColor = .red;
    let label = UILabel();
    label.frame = view.bounds;
    label.text = "1. Click me to present Page B";
    label.textColor = .black;
    view.addSubview(label);
    let recognizer = UITapGestureRecognizer(target: self, action: #selector(presentSecondViewController));
    view.addGestureRecognizer(recognizer)
    self.window.rootViewController?.view.addSubview(view);
  }
  
  @objc
  func presentSecondViewController() {
    let engine = self.engine;
    if engine?.viewController != nil {
        engine?.viewController = nil;
    }
    
    self.flutterViewControllerB = FlutterViewController(engine: engine!, nibName: nil, bundle: nil);
        let screenWidth = UIScreen.main.bounds.width;
        let screenHeight = UIScreen.main.bounds.height;
    self.flutterViewControllerB?.preferredContentSize = CGSize(width: screenWidth, height: screenHeight - 200);
    self.flutterViewControllerB?.modalPresentationStyle = .pageSheet;
    self.flutterViewControllerA?.present(self.flutterViewControllerB!, animated: true, completion: {
        UIView.animate(withDuration: 0.3) {
            self.flutterViewControllerB?.view.bounds = CGRect(origin: CGPoint(x:0,y:0), size: CGSize(width: screenWidth, height: 600));
            self.flutterViewControllerB?.view.layoutIfNeeded()
        }
    });
  }
}
