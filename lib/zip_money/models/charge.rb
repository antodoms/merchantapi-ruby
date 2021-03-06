#Merchant API 
#ZipMoney Merchant API Initial build
#zipMoney Merchant API version: 2017-03-01


require 'date'

module ZipMoney

  class Charge
    attr_accessor :id

    attr_accessor :reference

    attr_accessor :amount

    attr_accessor :currency

    attr_accessor :state

    attr_accessor :captured_amount

    # The amount of the charge that has been refunded 
    attr_accessor :refunded_amount

    attr_accessor :created_date

    attr_accessor :order

    attr_accessor :metadata

    class EnumAttributeValidator
      attr_reader :datatype
      attr_reader :allowable_values

      def initialize(datatype, allowable_values)
        @allowable_values = allowable_values.map do |value|
          case datatype.to_s
          when /Integer/i
            value.to_i
          when /Float/i
            value.to_f
          else
            value
          end
        end
      end

      def valid?(value)
        !value || allowable_values.include?(value)
      end
    end

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        :'id' => :'id',
        :'reference' => :'reference',
        :'amount' => :'amount',
        :'currency' => :'currency',
        :'state' => :'state',
        :'captured_amount' => :'captured_amount',
        :'refunded_amount' => :'refunded_amount',
        :'created_date' => :'created_date',
        :'order' => :'order',
        :'metadata' => :'metadata'
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        :'id' => :'String',
        :'reference' => :'String',
        :'amount' => :'Float',
        :'currency' => :'String',
        :'state' => :'String',
        :'captured_amount' => :'Float',
        :'refunded_amount' => :'Float',
        :'created_date' => :'DateTime',
        :'order' => :'ChargeOrder',
        :'metadata' => :'Object'
      }
    end

    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}){|(k,v), h| h[k.to_sym] = v}

      if attributes.has_key?(:'id')
        self.id = attributes[:'id']
      end

      if attributes.has_key?(:'reference')
        self.reference = attributes[:'reference']
      end

      if attributes.has_key?(:'amount')
        self.amount = attributes[:'amount']
      end

      if attributes.has_key?(:'currency')
        self.currency = attributes[:'currency']
      end

      if attributes.has_key?(:'state')
        self.state = attributes[:'state']
      end

      if attributes.has_key?(:'captured_amount')
        self.captured_amount = attributes[:'captured_amount']
      end

      if attributes.has_key?(:'refunded_amount')
        self.refunded_amount = attributes[:'refunded_amount']
      end

      if attributes.has_key?(:'created_date')
        self.created_date = attributes[:'created_date']
      end

      if attributes.has_key?(:'order')
        self.order = attributes[:'order']
      end

      if attributes.has_key?(:'metadata')
        self.metadata = attributes[:'metadata']
      end

    end

    # Show invalid properties with the reasons. Usually used together with valid?
    # @return Array for valid properies with the reasons
    def list_invalid_properties
      invalid_properties = Array.new
      if @id.nil?
        invalid_properties.push("invalid value for 'id', id cannot be nil.")
      end

      if @amount.nil?
        invalid_properties.push("invalid value for 'amount', amount cannot be nil.")
      end

      if @currency.nil?
        invalid_properties.push("invalid value for 'currency', currency cannot be nil.")
      end

      if @state.nil?
        invalid_properties.push("invalid value for 'state', state cannot be nil.")
      end

      if @captured_amount.nil?
        invalid_properties.push("invalid value for 'captured_amount', captured_amount cannot be nil.")
      end

      if @captured_amount < 0
        invalid_properties.push("invalid value for 'captured_amount', must be greater than or equal to 0.")
      end

      if @refunded_amount.nil?
        invalid_properties.push("invalid value for 'refunded_amount', refunded_amount cannot be nil.")
      end

      if @refunded_amount < 0
        invalid_properties.push("invalid value for 'refunded_amount', must be greater than or equal to 0.")
      end

      if @created_date.nil?
        invalid_properties.push("invalid value for 'created_date', created_date cannot be nil.")
      end

      return invalid_properties
    end

    # Check to see if the all the properties in the model are valid
    # @return true if the model is valid
    def valid?
      return false if @id.nil?
      return false if @amount.nil?
      return false if @currency.nil?
      return false if @state.nil?
      state_validator = EnumAttributeValidator.new('String', ["authorised", "captured", "cancelled", "refunded"])
      return false unless state_validator.valid?(@state)
      return false if @captured_amount.nil?
      return false if @captured_amount < 0
      return false if @refunded_amount.nil?
      return false if @refunded_amount < 0
      return false if @created_date.nil?
      return true
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] state Object to be assigned
    def state=(state)
      validator = EnumAttributeValidator.new('String', ["authorised", "captured", "cancelled", "refunded"])
      unless validator.valid?(state)
        fail ArgumentError, "invalid value for 'state', must be one of #{validator.allowable_values}."
      end
      @state = state
    end

    # Custom attribute writer method with validation
    # @param [Object] captured_amount Value to be assigned
    def captured_amount=(captured_amount)
      if captured_amount.nil?
        fail ArgumentError, "captured_amount cannot be nil"
      end

      if captured_amount < 0
        fail ArgumentError, "invalid value for 'captured_amount', must be greater than or equal to 0."
      end

      @captured_amount = captured_amount
    end

    # Custom attribute writer method with validation
    # @param [Object] refunded_amount Value to be assigned
    def refunded_amount=(refunded_amount)
      if refunded_amount.nil?
        fail ArgumentError, "refunded_amount cannot be nil"
      end

      if refunded_amount < 0
        fail ArgumentError, "invalid value for 'refunded_amount', must be greater than or equal to 0."
      end

      @refunded_amount = refunded_amount
    end

    # Checks equality by comparing each attribute.
    # @param [Object] Object to be compared
    def ==(o)
      return true if self.equal?(o)
      self.class == o.class &&
          id == o.id &&
          reference == o.reference &&
          amount == o.amount &&
          currency == o.currency &&
          state == o.state &&
          captured_amount == o.captured_amount &&
          refunded_amount == o.refunded_amount &&
          created_date == o.created_date &&
          order == o.order &&
          metadata == o.metadata
    end

    # @see the `==` method
    # @param [Object] Object to be compared
    def eql?(o)
      self == o
    end

    # Calculates hash code according to all attributes.
    # @return [Fixnum] Hash code
    def hash
      [id, reference, amount, currency, state, captured_amount, refunded_amount, created_date, order, metadata].hash
    end

    # Builds the object from hash
    # @param [Hash] attributes Model attributes in the form of hash
    # @return [Object] Returns the model itself
    def build_from_hash(attributes)
      return nil unless attributes.is_a?(Hash)
      self.class.swagger_types.each_pair do |key, type|
        if type =~ /\AArray<(.*)>/i
          # check to ensure the input is an array given that the the attribute
          # is documented as an array but the input is not
          if attributes[self.class.attribute_map[key]].is_a?(Array)
            self.send("#{key}=", attributes[self.class.attribute_map[key]].map{ |v| _deserialize($1, v) } )
          end
        elsif !attributes[self.class.attribute_map[key]].nil?
          self.send("#{key}=", _deserialize(type, attributes[self.class.attribute_map[key]]))
        end # or else data not found in attributes(hash), not an issue as the data can be optional
      end

      self
    end

    # Deserializes the data based on type
    # @param string type Data type
    # @param string value Value to be deserialized
    # @return [Object] Deserialized data
    def _deserialize(type, value)
      case type.to_sym
      when :DateTime
        DateTime.parse(value)
      when :Date
        Date.parse(value)
      when :String
        value.to_s
      when :Integer
        value.to_i
      when :Float
        value.to_f
      when :BOOLEAN
        if value.to_s =~ /\A(true|t|yes|y|1)\z/i
          true
        else
          false
        end
      when :Object
        # generic object (usually a Hash), return directly
        value
      when /\AArray<(?<inner_type>.+)>\z/
        inner_type = Regexp.last_match[:inner_type]
        value.map { |v| _deserialize(inner_type, v) }
      when /\AHash<(?<k_type>.+?), (?<v_type>.+)>\z/
        k_type = Regexp.last_match[:k_type]
        v_type = Regexp.last_match[:v_type]
        {}.tap do |hash|
          value.each do |k, v|
            hash[_deserialize(k_type, k)] = _deserialize(v_type, v)
          end
        end
      else # model
        temp_model = ZipMoney.const_get(type).new
        temp_model.build_from_hash(value)
      end
    end

    # Returns the string representation of the object
    # @return [String] String presentation of the object
    def to_s
      to_hash.to_s
    end

    # to_body is an alias to to_hash (backward compatibility)
    # @return [Hash] Returns the object in the form of hash
    def to_body
      to_hash
    end

    # Returns the object in the form of hash
    # @return [Hash] Returns the object in the form of hash
    def to_hash
      hash = {}
      self.class.attribute_map.each_pair do |attr, param|
        value = self.send(attr)
        next if value.nil?
        hash[param] = _to_hash(value)
      end
      hash
    end

    # Outputs non-array value in the form of hash
    # For object, use to_hash. Otherwise, just return the value
    # @param [Object] value Any valid value
    # @return [Hash] Returns the value in the form of hash
    def _to_hash(value)
      if value.is_a?(Array)
        value.compact.map{ |v| _to_hash(v) }
      elsif value.is_a?(Hash)
        {}.tap do |hash|
          value.each { |k, v| hash[k] = _to_hash(v) }
        end
      elsif value.respond_to? :to_hash
        value.to_hash
      else
        value
      end
    end

  end

end
