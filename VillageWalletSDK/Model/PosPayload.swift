import UIKit

public protocol PosPayload {
	func schemaId() -> String?

	func payload() -> [String: AnyObject]
}
