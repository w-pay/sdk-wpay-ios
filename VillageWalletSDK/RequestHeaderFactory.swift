import UIKit

public protocol RequestHeaderFactory {
	func addHeaders(headers: inout [String: String]) -> Void
}
