import UIKit

public protocol TransactionRefundDetails {
	func reason() -> String

	func clientReference() -> String?
}
