import UIKit

import STTextView

public struct DummyPlugin: STPlugin {

    public init() { }

    public func setUp(context: any Context) {
        context.events.onWillChangeText(willChangeText)
        context.events.onDidChangeText(didChangeText)
        context.events.shouldChangeText(shouldChangeText)
        context.events.onContextMenu(contextMenu)
    }

    private func willChangeText(in affectedRange: NSTextRange) {
         print("will change handler!")
    }

    private func didChangeText(in affectedRange: NSTextRange, replacementString: String?) {
         print("did change handler!")
    }

    private func shouldChangeText(in textRange: NSTextRange, replacementString: String?) -> Bool {
        return true
    }

    private func contextMenu(_ location: NSTextLocation, _ contentManager: NSTextContentManager) -> UIMenu {
        let menu = UIMenu(
            title: "Dummy Plugin",
            children: [
                UIAction(title: "Dummy Action") { (action) in
                    print("Dummy Action Triggered")
                },
                UIAction(title: "Smart Action") { (action) in
                    print("Smart Action Triggered")
                }
            ]
        )
        return menu
    }
}
