/// @description Get rid of un-needed 0's and whitespace from
///              GM's json_encoding. Using for packet size optimization
///              in this networking system.
/// @function util_CreateMiniJsonBuffer(json_string)
/// @param {json_string} Json to minify
/// @credit to YellowAfterLife?

var s = argument0;
var i = 1, n = string_length(s);
var r = buffer_create(n + 1, buffer_grow, 1); // string buffer, for perforamnce.
while (i <= n) {
    var q = i;
    var c = string_ord_at(s, i);
    i += 1;
    switch (c) 
	{
        case 9: case 10: case 13: case 32: // (insignificant whitespace)
            break;

        case ord("\""): // string
            while (i <= n) {
                c = string_ord_at(s, i);
                if (c != ord("\\")) { // regular characters
                    i += 1;
                    if (c == ord("\"")) break; // string ends
                } else i += 2; // skip over escape characters, e.g. `\"`
            }
            buffer_write(r, buffer_text, string_copy(s, q, i - q));
            break;
			
        default:
            if (c >= ord("0") && c <= ord("9")) { // numbers
                var pre = true; // whether reading pre-dot or not
                var till = q; // index at which meaningful part of the number ends
                while (i <= n) {
                    c = string_ord_at(s, i);
                    if (c == ord(".")) {
                        pre = false;
                        i += 1;
                    } else if (c >= ord("0") && c <= ord("9")) {
                        // write all pre-dot, and till the last non-zero after dot:
                        if (pre || c != ord("0")) till = i;
                        i += 1;
                    } else break;
                }
                buffer_write(r, buffer_text, string_copy(s, q, till - q + 1));
            } else buffer_write(r, buffer_text, string_char_at(s, q)); // other things
    }
}
buffer_write(r, buffer_u8, 0); // string delimiter `\0`

return r;