

// inputs: input_actor, input_name, input_text
// outputs: display_text, display_flags

// Go through the input_text character by character to parse
var str_len = 0;
display_text = "";
for (var i = 0; i <= string_length(input_text); ++i) display_flags[i] = 0;

for (var i = 1; i <= string_length(input_text); ++i)
{
    var next_char = string_char_at(input_text, i);
    if (next_char == "$")
    {   // Escape character! We pull the next character as the code.
        i += 1;
        next_char = string_char_at(input_text, i);
        display_flags[str_len] = ord(next_char);
    }
    else
    {   // It's a display character! Just save it and keep track fo the length.
        display_text += next_char;
        str_len++;
    }
}

