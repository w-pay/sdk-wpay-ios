import UIKit

public enum QRCodePaymentReferenceType {
	case PAYMENT_REQUEST
	case PAYMENT_SESSION

	public static func valueOf(value: String) -> QRCodePaymentReferenceType? {
		switch(value.uppercased()) {
			case "PAYMENT_REQUEST":
				return QRCodePaymentReferenceType.PAYMENT_REQUEST

			case "PAYMENT_SESSION":
				return QRCodePaymentReferenceType.PAYMENT_SESSION

			default:
				return nil
		}
	}
}
