/// @ description Create a unique map key for the supplied object and object instance
var _newInst_ = argument0;
var _objName_ = object_get_name(_newInst_.object_index);

return _objName_ + INST_PROP_DELIMITER + string(_newInst_.xstart) + INST_PROP_DELIMITER + string(_newInst_.ystart);