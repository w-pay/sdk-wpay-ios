import UIKit

public protocol DynamicPayload {
	func schemaId() -> String?

	func payload() -> [String: AnyObject]
}
