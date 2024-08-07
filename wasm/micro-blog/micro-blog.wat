(module
 (memory (export "mem") 1)

 ;;
 ;; Truncate UTF-8 input string to 5 characters
 ;;
 ;; @param {i32} offset - The offset of the input string in linear memory
 ;; @param {i32} length - The length of the input string in linear memory
 ;;
 ;; @returns {(i32,i32)} - The offset and length of the truncated string in linear memory
 ;;
 (func (export "truncate") (param $offset i32) (param $length i32) (result i32 i32)
  i32.const 5
  local.get $length
  i32.lt_u
  if
    local.get $offset
    i32.const 5
    return
  end
  local.get $offset
  local.get $length
  return
 )
 )
