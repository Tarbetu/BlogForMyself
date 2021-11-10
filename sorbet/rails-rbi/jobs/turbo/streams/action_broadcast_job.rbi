# typed: strong
# This is an autogenerated file for Rails' jobs.
# Please rerun bundle exec rake rails_rbi:jobs to regenerate.
class Turbo::Streams::ActionBroadcastJob
  sig do
    params(
      stream: T.untyped,
      action: T.untyped,
      target: T.untyped,
      rendering: T.untyped
    ).returns(Turbo::Streams::ActionBroadcastJob)
  end
  def self.perform_later(stream, action:, target:, **rendering); end

  sig do
    params(
      stream: T.untyped,
      action: T.untyped,
      target: T.untyped,
      rendering: T.untyped
    ).returns(Turbo::Streams::ActionBroadcastJob)
  end
  def self.perform_now(stream, action:, target:, **rendering); end

  sig do
    params(
      wait: T.nilable(ActiveSupport::Duration),
      wait_until: T.nilable(T.any(ActiveSupport::TimeWithZone, Date, Time)),
      queue: T.nilable(T.any(String, Symbol)),
      priority: T.nilable(Integer)
    ).returns(T.self_type)
  end
  def self.set(wait: nil, wait_until: nil, queue: nil, priority: nil); end
end
