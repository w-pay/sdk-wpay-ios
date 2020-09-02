import UIKit

public protocol Payment {
	var paymentRequestId: String { get }
	var merchantReferenceId: String { get }
	var grossAmount: Decimal { get }
}
