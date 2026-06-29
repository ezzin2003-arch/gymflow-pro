import '../entities/member.dart';

abstract class MemberRepository {

  Future<void> addMember(Member member);

  Future<List<Member>> getAllMembers();

  Future<Member?> getMemberById(String id);

  Future<void> deleteMember(String id);
}
