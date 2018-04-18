




-- Calculate interest for loopping
function CalcInterestLoop(monthSum)
    -- config
    -- local interestRatePerMonth = 0.75 / 100
    local interestRatePerMonth = 1.12 / 100
    local principal = 18000
    local stage = 12

    -- calc
    local principalList = {}
    local principalDecList = {}
    local principalIncList = {}
    local interestList = {}
    local interestSum = 0

    print("calculate principal:")
    for i = 1, monthSum do
        principalDecList[i] = principalIncList[i - stage] or 0
        principalIncList[i] = 0

        if 1 == i then
            principalList[i] = principal
            principalIncList[i] = principal
        else
            principalIncList[i] = (principalList[i - 1] - principalDecList[i]) * (1 / stage) +
                                    (principalIncList[i - stage] or 0) * (1 / stage)
            principalList[i] = principalList[i - 1] - principalDecList[i] + principalIncList[i]
        end

        interestList[i] = principalList[i] * interestRatePerMonth
        interestSum = interestSum + interestList[i]

        local principalLeft = 0
        for j = 1, stage do
            principalLeft = principalLeft + (principalIncList[i - j + 1] or 0) * ((stage - j + 1) / stage)
        end

        print(i .. " = " .. math.floor(principalList[i]) ..
            " principalInc = " .. math.floor(principalIncList[i]) ..
            " principalDec = " .. math.floor(principalDecList[i]) ..
            " interest = " .. math.floor(interestList[i]) ..
            " principalLeft = " .. math.floor(principalLeft))

        if 0 == i % 12 then
            print("one year:interestSum = " .. interestSum)
            print("interest per month = " .. interestSum / i ..
                " rate = " .. interestSum / i / principal ..
                " principalLeft = " .. principalLeft)
        end
    end

    print("interestSum = " .. interestSum)
    print("interest per month = " .. interestSum / monthSum ..
        " rate = " .. interestSum / monthSum / principal)
end
CalcInterestLoop(120)


8000 / 3 + 4666 * 2 / 3 + 4222

5000
3 1.34 1172 195
6 1.18 1131 188
9 1.14 1092 182
12 11.2 1083 180
