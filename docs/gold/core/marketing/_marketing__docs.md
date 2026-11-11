- name: purchase_segment
        data_tests:
          - not_null
          - accepted_values:
              arguments:
                values: ['never_bought', 'one_purchase', 'two_purchases', 'three_or_more']
