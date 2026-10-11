/// Model representing an included feature in a subscription plan.
class SubscriptionFeature {
  const SubscriptionFeature({
    required this.title,
    this.isIncluded = true,
  });

  final String title;
  final bool isIncluded;

  static const List<SubscriptionFeature> proFeatures = [
    SubscriptionFeature(title: 'AI WhatsApp assistant'),
    SubscriptionFeature(title: 'Unlimited conversations'),
    SubscriptionFeature(title: 'Google / Apple calendar integration'),
    SubscriptionFeature(title: 'Booking links and reservations'),
    SubscriptionFeature(title: 'Priority support'),
  ];
}
