clear
clc
%base is 01.01.2022 Friday
%01.01.2023: Monday, 01.01.2022: Friday, 01.01.2021: Tuesday, 
%01.01
%2020: Saturday, 04.03.2020: Saturday, 05.02.2023: Sunday

theDay = input("Enter the day (from 1 to 30) :");
theMonth = input("Enter the month (from 1 to 12) :");
theYear = input("Enter the year :");

if(theYear < 2022)
    surplus = -(2022-theYear)*3;
    theMod = mod(((theDay-1)+(theMonth-1)*30)+surplus,7);
    theDifference = (30-theDay)+(12-(theMonth))*30+(2022-(theYear+1))*360+2*30+7;

elseif(theYear == 2022)
    theMod = mod((theDay-1)+(theMonth-1)*30,7);
    if(theMonth > 3)
        theDifference = theDay+(30-7)+(theMonth-1-3)*30;
    elseif(theMonth < 3)
        theDifference = (30-theDay)+7+(3-(theMonth+1))*30;
    else
        if(theDay > 7)
            theDifference = theDay-7;
        elseif(theDay < 7)
            theDifference = 7-theDay;
        else
            theDifference = 0;
        end
    end

elseif(theYear > 2022)
    surplus = (theYear-2022)*3;
    theMod = mod((theDay-1)+(theMonth-1)*30+surplus,7);
    theDifference = theDay+(theMonth)*30+(theYear-1-2022)*360+(30-7)+(12-4)*30;
end

theDifferenceYear = floor(theDifference/360);
theDifferenceMonth = floor(mod(theDifference/30,12));
theDifferenceDay = theDifference-(theDifferenceYear*360+theDifferenceMonth*30);


%fprintf("the mod : %f", theMod);

if(theMod == 0)
    fprintf("It is Friday.")
elseif(theMod == 1)
    fprintf("It is Saturday.")
elseif(theMod == 2)
    fprintf("It is Sunday.");
elseif(theMod == 3)
    fprintf("It is Monday.");
elseif(theMod == 4)
    fprintf("It is Tuesday.");
elseif(theMod == 5)
    fprintf("It is Wednesday.");
elseif(theMod == 6)
    fprintf("It is Thursday.");
end
%fprintf("\nthe difference %f",theDifference);
fprintf("\nThe difference between 7.3.2022 and %.0f.%.0f.%.0f is %.0f year(s) %.0f month(s) %.0f day(s).", ...
    theDay,theMonth,theYear,theDifferenceYear,theDifferenceMonth,theDifferenceDay);

