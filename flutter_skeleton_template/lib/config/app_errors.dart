///Error type enum
// ignore_for_file: public_member_api_docs

enum ErrorList {
  ///Unknown error
  unknown,

  ///Firebase error
  ///Add item to firebase error
  addItemError,

  ///get item from firebase error
  getItemError,

  ///Get item list error
  getCategoriesError,

  ///Create batch error
  firebaseCreateBatchError,
  firebaseDeleteBatchError,
  firebaseReadBatchDataError,
  firebaseGetBatchListError,
  firebaseUpdateBatchDataError,
  firebaseAddBatchNoteError,

  localCreateBatchError,
  localReadBatchError,
  localUpdateBatchError,
  localDeleteBatchError,
  localGetBatchListError,
}

// ///Utility to convert error enum to string
// class ErrorList {
//   ErrorList._();

//   ///Get error description with [rErr]
//   static String getErrorDescription(Errors rErr) {
//     switch (rErr) {
//       case Errors.addItemError:
//         return 'Thêm hàng hóa vào CSDL gặp lỗi';
//       case Errors.getItemError:
//         return 'Lấy thông tin hàng hóa từ CSDL gặp lỗi';
//       case Errors.getCategoriesError:
//         return 'Lấy danh sách nhóm hàng từ CSDL gặp lỗi';

//       case Errors.unknown:
//         return 'Gặp lỗi không xác định';
//     }
//   }
// }
