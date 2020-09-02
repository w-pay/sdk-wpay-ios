import UIKit

public protocol TransactionRefundDetails {
	var reason: String { get }

	var clientReference: String? { get }
}
