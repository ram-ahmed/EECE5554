// Auto-generated. Do not edit!

// (in-package sensor_fusion.srv)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------


//-----------------------------------------------------------

class convert_to_quaternion_datatypeRequest {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.deg_yaw = null;
      this.deg_pitch = null;
      this.deg_roll = null;
    }
    else {
      if (initObj.hasOwnProperty('deg_yaw')) {
        this.deg_yaw = initObj.deg_yaw
      }
      else {
        this.deg_yaw = 0.0;
      }
      if (initObj.hasOwnProperty('deg_pitch')) {
        this.deg_pitch = initObj.deg_pitch
      }
      else {
        this.deg_pitch = 0.0;
      }
      if (initObj.hasOwnProperty('deg_roll')) {
        this.deg_roll = initObj.deg_roll
      }
      else {
        this.deg_roll = 0.0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type convert_to_quaternion_datatypeRequest
    // Serialize message field [deg_yaw]
    bufferOffset = _serializer.float64(obj.deg_yaw, buffer, bufferOffset);
    // Serialize message field [deg_pitch]
    bufferOffset = _serializer.float64(obj.deg_pitch, buffer, bufferOffset);
    // Serialize message field [deg_roll]
    bufferOffset = _serializer.float64(obj.deg_roll, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type convert_to_quaternion_datatypeRequest
    let len;
    let data = new convert_to_quaternion_datatypeRequest(null);
    // Deserialize message field [deg_yaw]
    data.deg_yaw = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [deg_pitch]
    data.deg_pitch = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [deg_roll]
    data.deg_roll = _deserializer.float64(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 24;
  }

  static datatype() {
    // Returns string type for a service object
    return 'sensor_fusion/convert_to_quaternion_datatypeRequest';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'd9325c181bdd22d8eac55b18f84a5eef';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    float64 deg_yaw
    float64 deg_pitch
    float64 deg_roll
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new convert_to_quaternion_datatypeRequest(null);
    if (msg.deg_yaw !== undefined) {
      resolved.deg_yaw = msg.deg_yaw;
    }
    else {
      resolved.deg_yaw = 0.0
    }

    if (msg.deg_pitch !== undefined) {
      resolved.deg_pitch = msg.deg_pitch;
    }
    else {
      resolved.deg_pitch = 0.0
    }

    if (msg.deg_roll !== undefined) {
      resolved.deg_roll = msg.deg_roll;
    }
    else {
      resolved.deg_roll = 0.0
    }

    return resolved;
    }
};

class convert_to_quaternion_datatypeResponse {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.qx = null;
      this.qy = null;
      this.qz = null;
      this.qw = null;
    }
    else {
      if (initObj.hasOwnProperty('qx')) {
        this.qx = initObj.qx
      }
      else {
        this.qx = 0.0;
      }
      if (initObj.hasOwnProperty('qy')) {
        this.qy = initObj.qy
      }
      else {
        this.qy = 0.0;
      }
      if (initObj.hasOwnProperty('qz')) {
        this.qz = initObj.qz
      }
      else {
        this.qz = 0.0;
      }
      if (initObj.hasOwnProperty('qw')) {
        this.qw = initObj.qw
      }
      else {
        this.qw = 0.0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type convert_to_quaternion_datatypeResponse
    // Serialize message field [qx]
    bufferOffset = _serializer.float64(obj.qx, buffer, bufferOffset);
    // Serialize message field [qy]
    bufferOffset = _serializer.float64(obj.qy, buffer, bufferOffset);
    // Serialize message field [qz]
    bufferOffset = _serializer.float64(obj.qz, buffer, bufferOffset);
    // Serialize message field [qw]
    bufferOffset = _serializer.float64(obj.qw, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type convert_to_quaternion_datatypeResponse
    let len;
    let data = new convert_to_quaternion_datatypeResponse(null);
    // Deserialize message field [qx]
    data.qx = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [qy]
    data.qy = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [qz]
    data.qz = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [qw]
    data.qw = _deserializer.float64(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 32;
  }

  static datatype() {
    // Returns string type for a service object
    return 'sensor_fusion/convert_to_quaternion_datatypeResponse';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '6e41723dd8df2efa508384c23a439e4c';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    float64 qx
    float64 qy
    float64 qz
    float64 qw
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new convert_to_quaternion_datatypeResponse(null);
    if (msg.qx !== undefined) {
      resolved.qx = msg.qx;
    }
    else {
      resolved.qx = 0.0
    }

    if (msg.qy !== undefined) {
      resolved.qy = msg.qy;
    }
    else {
      resolved.qy = 0.0
    }

    if (msg.qz !== undefined) {
      resolved.qz = msg.qz;
    }
    else {
      resolved.qz = 0.0
    }

    if (msg.qw !== undefined) {
      resolved.qw = msg.qw;
    }
    else {
      resolved.qw = 0.0
    }

    return resolved;
    }
};

module.exports = {
  Request: convert_to_quaternion_datatypeRequest,
  Response: convert_to_quaternion_datatypeResponse,
  md5sum() { return 'b6b76783e497fcb836668982f5fd5ffd'; },
  datatype() { return 'sensor_fusion/convert_to_quaternion_datatype'; }
};
