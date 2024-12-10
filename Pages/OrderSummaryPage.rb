class OrderSummaryPage
    include Capybara::DSL
    include RSpec::Matchers # Esto permite usar 'expect'
  
    def verify_order_summary(expected_table)
      expected_table.hashes.each do |row|
        row.each do |key, value|
          expect(page).to have_text(/#{Regexp.escape(value.strip)}/)
        end
      end
    end
end
  