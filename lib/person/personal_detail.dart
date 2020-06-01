import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:path_provider/path_provider.dart';
import 'package:snumngo/config/constants.dart';
import 'package:snumngo/config/validator.dart';
import 'package:snumngo/generated/l10n.dart';
import 'package:snumngo/person/bloc/bloc.dart';
import 'package:snumngo/person/model/address.dart';

import 'model/person.dart';

class PersonalInfoWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    PersonBloc pb = BlocProvider.of<PersonBloc>(context);

    return BlocBuilder<PersonBloc, PersonState>(
      builder: (context, state) {
        WorkerInfo pi = state.person.personalInfo;

        return Column(
          children: <Widget>[
            Center(
              child: CircleAvatar(
                child: Icon(
                  Icons.person,
                  size: 30,
                ),
                radius: 40,
              ),
            ),
            TextFormField(
              initialValue: pi.sno,
              autovalidate: true,
              validator: (value) {
                if (value.isEmpty) {
                  return 'S No is Required';
                }
                return null;
              },
              decoration: InputDecoration(labelText: S.of(context).sno),
              onChanged: (val) {
                pb.add(UpdateSno(val));
              },
            ),
            TextFormField(
              autovalidate: true,
              validator: (value) {
                if (value.length < 1) {
                  return 'Username is Required';
                }
                return null;
              },
              initialValue: pi.name,
              decoration: InputDecoration(
                labelText: S.of(context).name,
                icon: Icon(Icons.person),
              ),
              onChanged: (val) {
                pb.add(UpdateName(val));
              },
            ),
            TextFormField(
              initialValue: pi.mobile,
              maxLength: 10,
              inputFormatters: [
                WhitelistingTextInputFormatter.digitsOnly
              ],
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                  labelText: S.of(context).mobile_num, icon: Icon(Icons.phone)),
              onChanged: (val) {
                pb.add(UpdateMobile(val));
              },
              validator: (value) {
                if (value.isNotEmpty && value.length < 10)
                  return 'Enter Valid Number';
                return null;
              },
            ),
            TextFormField(
              initialValue: pi.whatsapp,
              maxLength: 10,
              inputFormatters: [
                WhitelistingTextInputFormatter.digitsOnly
              ],
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                  labelText: S.of(context).whatsapp_number,
                  icon: Icon(FontAwesome.whatsapp)),
              onChanged: (val) {
                pb.add(UpdateWhatsapp(val));
              },
              validator: (value) {
                if (value.isNotEmpty && value.length < 10)
                  return 'Enter Valid Number';
                return null;
              },
            ),
            Row(
              children: <Widget>[
                Expanded(
                  flex: 2,
                  child: Text(S.of(context).gender),
                ),
                Expanded(
                  flex: 4,
                  child: RadioListTile(
                    onChanged: (val) {
                      pb.add(UpdateGender(val));
                    },
                    value: "M",
                    groupValue: pi.gender,
                    title: Text(S.of(context).male),
                  ),
                ),
                Expanded(
                  flex: 5,
                  child: RadioListTile(
                    onChanged: (val) {
                      pb.add(UpdateGender(val));
                    },
                    value: "F",
                    groupValue: pi.gender,
                    title: Text(S.of(context).female),
                  ),
                )
              ],
            ),
            _DOBWidget(
              dob: pi.dob ?? DateTime.now(),
              onDateChange: (val) {
                pb.add(UpdateDob(val));
              },
            ),
            TextFormField(
              initialValue: pi.fatherName,
              decoration:
                  InputDecoration(labelText: S.of(context).fathers_name),
              onChanged: (val) {
                pb.add(UpdateFathersName(val));
              },
            ),
            TextFormField(
              initialValue: pi.motherName,
              decoration:
                  InputDecoration(labelText: S.of(context).mothers_name),
              onChanged: (val) {
                pb.add(UpdateMothersName(val));
              },
            ),
          ],
        );
      },
    );
  }
}

class AddressWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    PersonBloc pb = BlocProvider.of(context);
    return BlocBuilder<PersonBloc, PersonState>(
      builder: (context, state) {
        Address address = state.person.address;
        return Column(
        children: <Widget>[
          TextFormField(
            initialValue: address.houseNo,
            decoration: InputDecoration(labelText: S.of(context).house),
            onChanged: (val) {
              pb.add(UpdateHouseNo(val));
            },
          ),
          TextFormField(
            initialValue: address.street,
            decoration: InputDecoration(labelText: S.of(context).street),
            onChanged: (val) {
              pb.add(UpdateStreet(val));
            },
          ),
          TextFormField(
            initialValue: address.city,
            decoration: InputDecoration(labelText: S.of(context).city),
            onChanged: (val) {
              pb.add(UpdateCity(val));
            },
          ),
          TextFormField(
            initialValue: address.ward,
            decoration: InputDecoration(labelText: S.of(context).ward),
            onChanged: (val) {
              pb.add(UpdateWard(val));
            },
          ),
          TextFormField(
            initialValue: address.municipal,
            decoration: InputDecoration(labelText: S.of(context).muncipal),
            onChanged: (val) {
              pb.add(UpdateMunicipal(val));
            },
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Expanded(
                child: TextFormField(
                  initialValue: address.district,
                  decoration:
                      InputDecoration(labelText: S.of(context).district),
                  onChanged: (val) {
                    pb.add(UpdateDistrict(val));
                  },
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Expanded(
                child: TextFormField(
                  initialValue: address.pincode,
                  maxLength: 6,
                  inputFormatters: [
                    WhitelistingTextInputFormatter.digitsOnly
                  ],
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(labelText: S.of(context).pincode),
                  onChanged: (val) {
                    pb.add(UpdatePincode(val));
                  },
                  validator: (value) {
                    if (value.isNotEmpty && value.length < 6)
                      return 'Not Valid Pincode';
                    return null;
                  },
                ),
              ),
            ],
          ),
          DropdownButtonFormField(
            validator: (value) {
              if (value == null) {
                return 'Stare is Required';
              }
              return null;
            },
            decoration: InputDecoration(
                contentPadding: EdgeInsets.only(bottom: 0, top: 12),
                labelText: S.of(context).state),
            onChanged: (val) {
              pb.add(UpdateState(val));
            },
            value: address.state,
            items: Constants.STATES.map<DropdownMenuItem<String>>((v) {
              return DropdownMenuItem<String>(
                value: v,
                child: Text(Intl.message(v)),
              );
            }).toList(),
          )
        ],
      );
      },
    );
  }
}

class DisabilityWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    PersonBloc pb = BlocProvider.of(context);
    return BlocBuilder<PersonBloc, PersonState>(
      builder: (context, state) {
        Disability dsb = state.person.disability;
        return Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Expanded(
                  flex: 2,
                  child: Text(S.of(context).disability),
                ),
                Flexible(
                  flex: 1,
                  child: SwitchListTile(
                    value: dsb.disable,
                    onChanged: (val) {
                      pb.add(IsDisableEvent(val));
                    },
                  ),
                )
              ],
            ),
            dsb.disable
                ? Row(
                    children: <Widget>[
                      Expanded(
                        flex: 2,
                        child: TextFormField(
                          initialValue: dsb.certificateNo,
                          onChanged: (val) {
                            pb.add(UpdateDisabilityCertiNo(val));
                          },
                          decoration: InputDecoration(
                              labelText: S.of(context).disable_certi_no),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Container(
                            padding: EdgeInsets.all(5),
                            alignment: Alignment.center,
                            child: ImagePickAndCrop(
                              imageWidth: 100,
                              ratioX: 1,
                              ratioY: 1.4,
                              imgQuality: 10,
                              xres: 900,
                              yres: 900,
                              imageUrl: dsb.certificateUrl,
                              onImageSelected: (File image) {
                                pb.add(UpdateDisabilityCertificate(image));
                              },
                            )),
                      )
                    ],
                  )
                : Container()
          ],
        );
      },
    );
  }
}

class AadharBankWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    PersonBloc pb = BlocProvider.of(context);
    return BlocBuilder<PersonBloc, PersonState>(
      builder: (context, state) {
        AadharBankDetail ab = state.person.aadhaarBank;
        return Column(
          children: <Widget>[
            TextFormField(
              maxLength: 12,
              inputFormatters: [WhitelistingTextInputFormatter.digitsOnly],
              validator: (value) {
                if (value.isNotEmpty && value.length < 12)
                  return 'Enter Valid Aadhaar';
                return null;
              },
              initialValue: ab.aadhaarNo,
              onChanged: (val) {
                pb.add(AadharNumberUpdate(val));
              },
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: S.of(context).aadhar_no,
              ),
            ),
            ab.aadhaarNo != null && ab.aadhaarNo.length > 0
                ? Row(
                    children: <Widget>[
                      Expanded(
                        child: Container(
                          margin: EdgeInsets.all(8.0),
                          child: Column(
                            children: <Widget>[
                              ImagePickAndCrop(
                                ratioY: 2.125,
                                ratioX: 3.375,
                                imageUrl: ab.frontUrl,
                                onImageSelected: (file) {
                                  if (file != null)
                                    pb.add(AadharUrlFrontUpdate(file));
                                },
                              ),
                              Text(S.of(context).front_aadhar)
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          margin: EdgeInsets.all(8.0),
                          child: Column(
                            children: <Widget>[
                              ImagePickAndCrop(
                                ratioY: 2.125,
                                ratioX: 3.375,
                                imageUrl: ab.backUrl,
                                onImageSelected: (file) {
                                  if (file != null)
                                    pb.add(AadharUrlBackUpdate(file));
                                },
                              ),
                              Text(S.of(context).back_aadhar)
                            ],
                          ),
                        ),
                      ),
                    ],
                  )
                : Container(),
            Row(
              children: <Widget>[
                Expanded(
                  flex: 2,
                  child: Text(S.of(context).aadhaar_link),
                ),
                Flexible(
                  flex: 1,
                  child: SwitchListTile(
                    value: ab.bankLinked,
                    onChanged: (val) {
                      pb.add(AadharBankLinkedUpdate(val));
                    },
                  ),
                )
              ],
            ),
            ab.bankLinked
                ? Container(
                    child: Column(
                      children: <Widget>[
                        TextFormField(
                          initialValue: ab.bankName,
                          decoration: InputDecoration(
                            labelText: S.of(context).bank_name,
                          ),
                        ),
                        TextFormField(
                          initialValue: ab.accountNumber,
                          decoration: InputDecoration(
                            labelText: S.of(context).bank_acc_no,
                          ),
                        ),
                        TextFormField(
                          initialValue: ab.ifscCode,
                          decoration: InputDecoration(
                            labelText: S.of(context).ifcs,
                          ),
                        ),
                      ],
                    ),
                  )
                : Container()
          ],
        );
      },
    );
  }
}

class PanVoterWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PersonBloc, PersonState>(
      builder: (context, state) {
        PanVoterDetail pvd = state.person.panVoterDetail;

        PersonBloc pb = BlocProvider.of(context);
        return Container(
          child: Column(
            children: <Widget>[
              TextFormField(
                initialValue: pvd.pancard,
                autovalidate: true,
                textCapitalization: TextCapitalization.characters,
                maxLength: 10,
                inputFormatters: [
                  WhitelistingTextInputFormatter(RegExp("[a-zA-Z0-9]")),
                ],
                onChanged: (val) {
                  pb.add(UpdatePanCardNo(val));
                },
                decoration: InputDecoration(labelText: S.of(context).pan_no),
                validator: (value) {
                  if (value.isNotEmpty && !Validators.isValidPanCard(value))
                    return 'Not Valid Pancard';
                  return null;
                },
              ),
              pvd.pancard != null && pvd.pancard.isNotEmpty
                  ? Container(
                      margin: EdgeInsets.only(top: 10),
                      child: ImagePickAndCrop(
                        ratioY: 2.125,
                        ratioX: 3.375,
                        onImageSelected: (file) {
                          pb.add(UpdatePanUrl(file));
                        },
                        imageUrl: pvd.panUrl,
                      ),
                    )
                  : Container(),
              TextFormField(
                initialValue: pvd.voterCard,
                onChanged: (val) {
                  pb.add(UpdateVoteIdNo(val));
                },
                decoration: InputDecoration(labelText: S.of(context).voter_card),
              ),
              pvd.voterCard != null && pvd.voterCard.isNotEmpty
                  ? Row(
                      children: <Widget>[
                        Expanded(
                          child: Container(
                            margin: EdgeInsets.all(8.0),
                            child: Column(
                              children: <Widget>[
                                ImagePickAndCrop(
                                  ratioX: 21.25,
                                  ratioY: 33.75,
                                  imageUrl: pvd.voterUrlFront,
                                  onImageSelected: (file) {
                                    if (file != null)
                                      pb.add(UpdateVoterFrontUrl(file));
                                  },
                                ),
                                Text(S.of(context).front_voter)
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            margin: EdgeInsets.all(8.0),
                            child: Column(
                              children: <Widget>[
                                ImagePickAndCrop(
                                  ratioX: 2.125,
                                  ratioY: 3.375,
                                  imageUrl: pvd.voterUrlBack,
                                  onImageSelected: (file) {
                                    if (file != null)
                                      pb.add(UpdateVoterBackUrl(file));
                                  },
                                ),
                                Text(S.of(context).back_voter)
                              ],
                            ),
                          ),
                        ),
                      ],
                    )
                  : Container(),
            ],
          ),
        );
      },
    );
  }
}

class _DOBWidget extends StatelessWidget {
  final Function onDateChange;
  final DateTime dob;

  const _DOBWidget({Key key, this.onDateChange, this.dob}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: <Widget>[
          Expanded(
            child: Text(
              S.of(context).dob,
              maxLines: 2,
            ),
          ),
          Expanded(
            child: OutlineButton(
              child: Text(DateFormat("dd-MMM-yyyy").format(dob)),
              onPressed: () {
                showDatePicker(
                  context: context,
                  initialDate: dob,
                  firstDate: DateTime(1950),
                  lastDate: DateTime.now(),
                ).then((value) {
                  if (value != null) onDateChange(value);
                });
              },
            ),
          )
        ],
      ),
    );
  }
}

class ImagePickAndCrop extends StatelessWidget {
  final Function onImageSelected;
  final String imageUrl;
  final double ratioX;
  final double ratioY;
  final double imageHeight;
  final double imageWidth;
  final int xres;
  final int yres;
  final int imgQuality;
  ImagePickAndCrop(
      {Key key,
      @required this.onImageSelected,
      @required this.imageUrl,
      this.ratioX,
      this.ratioY,
      this.imageHeight,
      this.imageWidth, this.imgQuality,
      this.xres,
      this.yres})
      : assert(!((ratioX != null) ^ (ratioY != null))),
        super(key: key);

  Future getImage(ImageSource imgSrc, BuildContext context) async {
    print('Opening camera');
    var image = await ImagePicker().getImage(source: imgSrc);
//    print(image.lengthSync());
    File croppedImage = await ImageCropper.cropImage(
      sourcePath: image.path,
      aspectRatio: ratioX == null
          ? CropAspectRatio(ratioX: 3, ratioY: 2)
          : CropAspectRatio(ratioX: ratioX, ratioY: ratioY),
      compressQuality: 100,
      cropStyle: CropStyle.rectangle,
    );
    print(croppedImage.lengthSync());
    var tmpDir = await getTemporaryDirectory();
    File tmp = File ('${tmpDir.absolute.path}_${new DateTime.now().toIso8601String()}.jpg');
    File result = await FlutterImageCompress.compressAndGetFile(
      croppedImage.path, tmp.path,
      quality: imgQuality??10,
      minHeight: xres??600,
      minWidth: yres??600
    );
    print(result.lengthSync());
    if (result != null)  onImageSelected(result);
  }

  @override
  Widget build(BuildContext context) {
    bool _validUrl = imageUrl != null ? Uri.parse(imageUrl).isAbsolute : false;

    return Container(
      color: Colors.black12,
      width: imageWidth,
      height: imageHeight,
      child: Stack(
        children: <Widget>[
          _validUrl
              ? Image.network(
                  imageUrl,
                  fit: BoxFit.fill,
                )
              : imageUrl != null &&
                      imageUrl.isNotEmpty &&
                      Validators.isValidImagePath(imageUrl)
                  ? Image.file(
                      File(imageUrl),
                      fit: BoxFit.fill,
                    )
                  : Container(),
          Container(
            height: imageHeight,
            width: imageWidth ?? double.infinity,
            child: OutlineButton(
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 20),
                child: Center(
                  child: Icon(
                    FontAwesome.image,
                    color: Colors.black26,
                    size: 40,
                  ),
                ),
              ),
              onPressed: () {
                _buildModal(context);
              },
            ),
          )
        ],
      ),
    );
  }

  _buildModal(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return Container(
            child: Wrap(
              children: [
                ListTile(
                  leading: Icon(Icons.photo_camera),
                  title: Text('Camera'),
                  onTap: () async {
                    await getImage(ImageSource.camera, context);
                    Navigator.pop(bc);
                  },
                ),
                ListTile(
                  leading: Icon(Icons.filter),
                  title: Text('Gallery'),
                  onTap: () async {
                    await getImage(ImageSource.gallery, context);
                    Navigator.pop(bc);
                  },
                )
              ],
            ),
          );
        });
  }
}
