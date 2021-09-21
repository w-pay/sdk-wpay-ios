import UIKit

/**
  Detailed information for a payment being made.
 */
public protocol ImmediatePaymentRequest {
	/** A merchant application specific reference number. This number should uniquely identify the transaction in the merchant’s system. */
	var clientReference: String { get }

	/** The merchant order number of the transaction. */
	var orderNumber: String { get }

	/** An optional flag allowing the consumer to indicate that automatic rollback step should be skipped in the case of failure */
	var skipRollback: Bool? { get }

	/** An optional flag allowing the consumer to indicate that a partial success will not trigger a failure and rollback */
	var allowPartialSuccess: Bool? { get }

	/** List of payment to be made as part of this transaction  */
	var payments: [ImmediatePaymentItem] { get }

	/** Payload describing the specific POS system.  This payload originates in the payment request and is carried with any resulting transactions.  Provided in a generic schema previous configured by the merchant */
	var posPayload: PosPayload? { get }

	/** Payload provided by the merchant to support other types of messaging.  This payload originates in the payment request and is carried with any resulting transactions.  Provided in a generic schema previous configured by the merchant */
	var merchantPayload: MerchantPayload? { get }

	/** The transaction types to use for each instrument type. */
	var transactionType: PaymentTransactionType? { get }
}

public protocol ImmediatePaymentItem {
	/** The payment instrument id from the card capture iframe response or the list payment instruments response. */
	var paymentInstrumentId: String { get }

	/** The amount you want to pay with the payment instrument. */
	var amount: Decimal { get }
}

