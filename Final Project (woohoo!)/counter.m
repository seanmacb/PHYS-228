function [retval] = counter(array,length)
retval = 0;
for i = 1:length
    retval = retval + array(i);
end
end

