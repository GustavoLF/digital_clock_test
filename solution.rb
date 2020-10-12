class Test

    def solution(a,b,c,d)
        array = [a,b,c,d]
        @list_of_results = []

        array.each_with_index do |first_candidate, index|
            #Selecting first digit
            next if first_candidate > 2
            first_digit = first_candidate

            remaining_numbers = array.dup
            remaining_numbers.slice!(index)

            #Selecting second digit
            remaining_numbers.each_with_index do |second_candidate, index|
                next if first_digit == 2 && second_candidate >= 4
                second_digit = second_candidate

                remaining_minutes = remaining_numbers.dup
                remaining_minutes.slice!(index)

                #Checking if second number remaining can be used as first digit of minutes timer
                if remaining_minutes.first <= 5
                    third_digit = remaining_minutes.first
                    forth_digit = remaining_minutes.last
                    self.add_new(timestamp: [first_digit, second_digit, third_digit, forth_digit])
                end

                #Checking if third number remaining can be used as first digit of minutes timer
                if remaining_minutes.last <= 5
                    third_digit = remaining_minutes.last
                    forth_digit = remaining_minutes.first
                    self.add_new(timestamp: [first_digit, second_digit, third_digit, forth_digit])
                end
            end
        end    

        # Uncomment line below for debbuging 
        #puts @list_of_results 

        return @list_of_results.size
    end

    def add_new(params={})
        timestamp = params.fetch(:timestamp).join
        @list_of_results.push(timestamp) unless @list_of_results.include? timestamp
    end
end