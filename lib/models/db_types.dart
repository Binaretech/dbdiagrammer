import 'package:flutter/material.dart';

enum Type {
  VarChar,
  TinyInt,
  SmallInt,
  Integer,
  BigInt,
}

extension TypesExtention on Type {
  Widget toWidget({limit}) {
    String text;
    switch (this) {
      case Type.VarChar:
        text = 'VarChar';
        break;
      case Type.TinyInt:
        text = 'TinyInt';
        break;
      case Type.SmallInt:
        text = 'SmallInt';
        break;
      case Type.Integer:
        text = 'Integer';
        break;
      case Type.BigInt:
        text = 'BigInt';
        break;
    }

    return Text('$text${(limit != null ? '($limit)' : '')}');
  }
}

enum ConstraintType {
  NotNull,
  AutoIncrementable,
  Unique,
  Primary,
  Foreing,
}

extension ConstraintTypeExtention on ConstraintType {
  Widget toWidget({TextStyle style}) {
    switch (this) {
      case ConstraintType.Primary:
        return Icon(
          Icons.vpn_key,
          color: Colors.amberAccent,
        );
      case ConstraintType.Foreing:
        return Icon(
          Icons.vpn_key,
          color: Colors.redAccent,
        );
      case ConstraintType.NotNull:
        return Text('NN', style: style);
      case ConstraintType.AutoIncrementable:
        return Text('AI', style: style);
      case ConstraintType.Unique:
        return Text('UQ', style: style);
      default:
        return null;
    }
  }
}

enum RelationType {
  OneToOne,
  OneToMany,
}
