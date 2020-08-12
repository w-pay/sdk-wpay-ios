import UIKit

public protocol RequestHeadersFactory {
	func createHeaders() -> [String: String]
}
