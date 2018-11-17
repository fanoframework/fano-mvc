(*!------------------------------------------------------------
 * [[APP_NAME]] ([[APP_URL]])
 *
 * @link      [[APP_REPOSITORY_URL]]
 * @copyright Copyright (c) [[COPYRIGHT_YEAR]] [[COPYRIGHT_HOLDER]]
 * @license   [[LICENSE_URL]] ([[LICENSE]])
 *------------------------------------------------------------- *)

{%dependencies.inc}

{---put your dependencies registration here---}

{-----------------------------------------------
  file reader utility
------------------------------------------------}
container.add('fileReader', TStringFileReaderFactory.create());

{-----------------------------------------------
  view parameters
------------------------------------------------}
container.factory('viewParams', TViewParametersFactory.create());

{-----------------------------------------------
  setup html template parser
------------------------------------------------}
container.add('templateParser', TSimpleTemplateParserFactory.create());

{-----------------------------------------------
  header view
------------------------------------------------}
container.add('headerView', THeaderViewFactory.create());

{-----------------------------------------------
  footer view
------------------------------------------------}
container.add('footerView', TFooterViewFactory.create());

{-----------------------------------------------
  user listing view
------------------------------------------------}
container.add('userListingView', TUserListingViewFactory.create());
