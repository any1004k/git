package org.zerock.domain;

import java.util.List;

public class Reply1PageDTO {

		private int replyAllCnt;
		private List<Reply1VO> list;
		
		
		
		public Reply1PageDTO(int replyAllCnt, List<Reply1VO> list) {
			
			this.replyAllCnt = replyAllCnt;
			this.list = list;
		}
		
		public int getReplyAllCnt() {
			return replyAllCnt;
		}
		public void setReplyAllCnt(int replyAllCnt) {
			this.replyAllCnt = replyAllCnt;
		}
		public List<Reply1VO> getList() {
			return list;
		}
		public void setList(List<Reply1VO> list) {
			this.list = list;
		}
		@Override
		public String toString() {
			return "Reply1PageDTO [replyAllCnt=" + replyAllCnt + ", list=" + list + "]";
		}
		
		
		
		
}
