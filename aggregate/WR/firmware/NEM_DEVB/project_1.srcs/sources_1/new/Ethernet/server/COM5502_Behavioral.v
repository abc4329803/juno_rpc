function [4:0] max;
input   [4:0] L;
input   [4:0] R;
begin
	if(L >= R)
		max = L;
	else max = R;
end
endfunction

function  WS_EN;
input  [4:0] TCP_MAX_WINDOW_SIZE;
begin
	if(TCP_MAX_WINDOW_SIZE > 16) 
		// buffer size (either transmit or/and receive) is greater than 64KB. Window scaling is enabled.
		WS_EN = 1;
	else
		WS_EN = 0;
end
endfunction

