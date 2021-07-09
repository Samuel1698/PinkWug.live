ActiveRecord::ConnectionAdapters::AbstractAdapter.class_eval do
  alias_method :orig_initialize, :initialize

  # Extend database initialization to add our own functions
  def initialize(connection, logger = nil, pool = nil)
    orig_initialize(connection, logger, pool)
  end
end