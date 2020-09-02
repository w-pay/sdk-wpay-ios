import UIKit

public protocol PosPayload {
	var schemaId: String? { get }

	var payload: [String: AnyObject] { get }
}
